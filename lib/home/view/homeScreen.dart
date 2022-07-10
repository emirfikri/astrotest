// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables

import '../../../configs/helper/helper.dart';
import '../../individual/individual_page.dart';
import '../models/food_model.dart';
import 'package:flutter/material.dart';
import '../bloc/block_export.dart';
import '../widgets/buildError.dart';
import '../widgets/buildLoading.dart';
import '../widgets/homeCategoryCard.dart';
import '../widgets/homeHeader.dart';
import '../widgets/homeLocation.dart';
import '../widgets/initialText.dart';
import '../widgets/itemMenuCard.dart';
import '../widgets/searchBar.dart';

String? validate(String? value) {
  return value!.isEmpty ? "Empty" : "";
}

class HomeScreen extends StatefulWidget {
  final String category;

  HomeScreen({Key? key, required this.category}) : super(key: key);

  static Route<void> route({required String category}) {
    return MaterialPageRoute(
      builder: (context) => HomeScreen(
        category: category,
      ),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AllcategoryBloc allcategoryBloc = AllcategoryBloc();
  final FoodselectedcatBloc foodselectedcatBloc = FoodselectedcatBloc();
  String selectedCategory = '';
  final TextEditingController searchtextcontroller = TextEditingController();
  @override
  void initState() {
    if (RegExp(r"beverage", caseSensitive: false).hasMatch(widget.category)) {
      allcategoryBloc.add(GetDrinkCategory());
    } else {
      allcategoryBloc.add(GetFoodCategory());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AllcategoryBloc>(
          create: (BuildContext context) => allcategoryBloc,
        ),
        BlocProvider<FoodselectedcatBloc>(
          create: (BuildContext context) => foodselectedcatBloc,
        ),
      ],
      child: Scaffold(
        body: Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    HomeHeader(),
                    SizedBox(height: 20),
                    HomeLocation(),
                    SizedBox(height: 20),
                    SearchBar(
                        title: "Search Food", controller: searchtextcontroller),
                    SizedBox(height: 20),
                    Column(children: [blocCategoryList()]),
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular ${widget.category}",
                            style: Helper.getTheme(context).headline5,
                          ),
                          // TextButton(onPressed: () {}, child: Text("View all"))
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    blocAllMenuList(),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget blocCategoryList() {
    return BlocBuilder<AllcategoryBloc, AllcategoryState>(
      builder: (context, state) {
        if (state is AllcategoryInitial) {
          return BuildLoading();
        } else if (state is AllcategoryLoading) {
          return BuildLoading();
        } else if (state is FoodCategoryLoaded) {
          return allListCategory(thismodel: state.foodCategory);
        } else if (state is DrinkCategoryLoaded) {
          // print("object ${state.drinkCategory!.first.name}");
          return allListCategory(thismodel: state.drinkCategory);
        } else if (state is CategoryError) {
          return BuildError(text: state.message!);
        } else {
          return BuildError(text: "Uknown Error");
        }
      },
    );
  }

  Widget allListCategory({required thismodel}) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 130,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: thismodel.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      if (!RegExp(r"beverage", caseSensitive: false)
                          .hasMatch(widget.category)) {
                        foodselectedcatBloc.add(GetFoodSelectedcat(
                            selectedCat: thismodel[index].name));
                        selectedCategory = thismodel[index].name;
                      }
                    },
                    child: CategoryCard(
                      image: thismodel[index].image != ""
                          ? Image.network(thismodel[index].image)
                          : Image.asset(
                              Helper.getAssetName("drinksdefault.png")),
                      name: thismodel[index].name,
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              );
            }),
      ),
    );
  }

  Widget blocAllMenuList() {
    return BlocBuilder<FoodselectedcatBloc, FoodselectedcatState>(
      builder: (context, state) {
        if (state is FoodselectedcatInitial) {
          return BuildInitialText(category: widget.category);
        } else if (state is FoodselectedcatLoading) {
          return BuildLoading();
        } else if (state is FoodSelectedCatLoaded) {
          return allMenuList(thismenulist: state.foodModel!);
        } else if (state is FoodSelectedCatError) {
          return BuildError(text: state.message!);
        } else {
          return BuildError(text: "Uknown Error");
        }
      },
    );
  }

  Widget allMenuList({required List<FoodModel> thismenulist}) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: thismenulist.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () async {
                  Navigator.push(
                    context,
                    IndividualItemDetails.route(
                      itemId: thismenulist[index].id,
                    ),
                  );
                },
                child: ItemMenuCard(
                  image: Image.network(
                    thismenulist[index].image,
                    fit: BoxFit.cover,
                  ),
                  name: thismenulist[index].name,
                  selectedCategory: selectedCategory,
                ),
              ),
            ],
          );
        });
  }
}
