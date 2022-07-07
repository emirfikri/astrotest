// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables

import '../../../configs/helper/helper.dart';
import '../../../individual/presentation/pages/individualItem.dart';
import '../../../model/food_model.dart';
import 'package:flutter/material.dart';

import '../../../model/drinkcategory_model.dart';
import '../../../model/foodcategory_model.dart';
import '../../../services/api_services.dart';
import '../widgets/homeCategoryCard.dart';
import '../widgets/homeHeader.dart';
import '../widgets/homeLocation.dart';
import '../widgets/itemMenuCard.dart';
import '../widgets/searchBar.dart';

class SearchFieldValidator {
  static String? validate(String? value) {
    return value!.isEmpty ? "Empty" : "";
  }
}

class HomeScreen extends StatefulWidget {
  static const routeName = "/homeScreen";

  final String category;

  HomeScreen({Key? key, required this.category}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var categoryList;
  var menuList;
  bool isLoading = true;
  bool allMenuLoading = false;
  String selectedCategory = '';
  final TextEditingController searchtextcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (RegExp(r"beverage", caseSensitive: false).hasMatch(widget.category)) {
      getCategoryDrinks();
    } else {
      getCategoryFoods();
    }
  }

  getCategoryFoods() async {
    var rawdata = await ApiService()
        .getApiData("https://www.themealdb.com/api/json/v1/1/categories.php");
    var responseData = rawdata['categories'] as List;
    setState(() {
      categoryList = responseData.map((e) => FoodCategory.fromJson(e)).toList();
    });
    setState(() {
      isLoading = false;
    });
  }

  getListMealsbyCategory() async {
    var rawdata = await Future.delayed(
        Duration(seconds: 1),
        () => ApiService().getApiData(
            "https://www.themealdb.com/api/json/v1/1/filter.php?c=$selectedCategory"));
    var responseData = rawdata['meals'] as List;
    setState(() {
      menuList = responseData.map((e) => FoodModel.fromJson(e)).toList();
      allMenuLoading = false;
    });
  }

  getCategoryDrinks() async {
    var rawdata = await ApiService().getApiData(
        "https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list");
    var responseData = rawdata['drinks'] as List;
    setState(() {
      categoryList =
          responseData.map((e) => DrinkCategory.fromJson(e)).toList();
    });

    setState(() {
      isLoading = false;
    });
  }

  Widget allCategoryList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 130,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      if (!RegExp(r"beverage", caseSensitive: false)
                          .hasMatch(widget.category)) {
                        setState(() {
                          selectedCategory = categoryList[index].name;
                          allMenuLoading = true;
                          menuList = [];
                        });

                        await getListMealsbyCategory();
                      }
                    },
                    child: CategoryCard(
                      image: categoryList[index].image != ""
                          ? Image.network(categoryList[index].image)
                          : Image.asset(
                              Helper.getAssetName("drinksdefault.png")),
                      name: categoryList[index].name,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              );
            }),
      ),
    );
  }

  Widget allMenuList() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: menuList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IndividualItemDetails(
                        category: widget.category,
                        itemId: menuList[index].id,
                      ),
                    ),
                  );
                },
                child: ItemMenuCard(
                  image: Image.network(
                    menuList[index].image,
                    fit: BoxFit.cover,
                  ),
                  name: menuList[index].name,
                  selectedCategory: selectedCategory,
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  HomeHeader(),
                  SizedBox(
                    height: 20,
                  ),
                  HomeLocation(),
                  SizedBox(
                    height: 20,
                  ),
                  SearchBar(
                    title: "Search Food",
                    controller: searchtextcontroller,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      if (isLoading) ...[
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                      ] else ...[
                        allCategoryList(),
                      ],
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
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
                  SizedBox(
                    height: 20,
                  ),
                  allMenuLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : menuList != null &&
                              selectedCategory != '' &&
                              !RegExp(r"beverage", caseSensitive: false)
                                  .hasMatch(widget.category)
                          ? allMenuList()
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                widget.category != "Beverage"
                                    ? "No Category Selected"
                                    : "For Beverages still under development",
                                style: widget.category != "Beverage"
                                    ? Helper.getTheme(context).bodySmall
                                    : Helper.getTheme(context)
                                        .bodyMedium
                                        ?.copyWith(color: Colors.red),
                              ),
                            ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
