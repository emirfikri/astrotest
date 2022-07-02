// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables

import '../../helper/constants.dart';
import '../../model/food_model.dart';
import 'package:flutter/material.dart';

import '../../globalWidgets/searchBar.dart';
import '../../helper/colors.dart';
import '../../helper/helper.dart';
import '../../model/drinkcategory_model.dart';
import '../../model/foodcategory_model.dart';
import '../../services/api_services.dart';
import 'widgets/homeCategoryCard.dart';
import 'widgets/homeHeader.dart';
import 'widgets/homeLocation.dart';

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
  @override
  void initState() {
    super.initState();
    if (widget.category == 'Beverage') {
      getCategoryDrinks();
    } else {
      getCategoryFoods();
    }
  }

  getCategoryFoods() async {
    var rawdata = await getapidata(
        "https://www.themealdb.com/api/json/v1/1/categories.php");
    var responseData = rawdata['categories'] as List;
    setState(() {
      categoryList = responseData.map((e) => FoodCategory.fromJson(e)).toList();
    });
    setState(() {
      isLoading = false;
    });
  }

  getListMealsbyCategory() async {
    var rawdata = await getapidata(
        "https://www.themealdb.com/api/json/v1/1/filter.php?c=$selectedCategory");
    var responseData = rawdata['meals'] as List;
    setState(() {
      menuList = responseData.map((e) => FoodModel.fromJson(e)).toList();
    });
    menuList.forEach((var data) {
      print(data.toString());
    });
  }

  getCategoryDrinks() async {
    var rawdata = await getapidata(
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
                      setState(() {
                        selectedCategory = categoryList[index].name;
                      });
                      await getListMealsbyCategory();
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
                onTap: () async {},
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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      if (isLoading) ...[
                        CircularProgressIndicator(),
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
                  menuList != null && selectedCategory != ''
                      ? allMenuList()
                      : !allMenuLoading ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child:Text(
                                "No Category Selected",
                                style: Helper.getTheme(context).headline5,
                          ),
                        ) : CircularProgressIndicator(),
                  //
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Most Popular",
                          style: Helper.getTheme(context).headline5,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 250,
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          MostPopularCard(
                            image: Image.asset(
                              Helper.getAssetName("pizza4.jpg"),
                              fit: BoxFit.cover,
                            ),
                            name: "Cafe De Bambaa",
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          MostPopularCard(
                            name: "Burger by Bella",
                            image: Image.asset(
                              Helper.getAssetName("dessert3.jpg"),
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recent Items",
                          style: Helper.getTheme(context).headline5,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text("View all"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.of(context)
                            //     .pushNamed(IndividualItem.routeName);
                          },
                          child: RecentItemCard(
                            image: Image.asset(
                              Helper.getAssetName("pizza3.jpg"),
                              fit: BoxFit.cover,
                            ),
                            name: "Mulberry Pizza by Josh",
                          ),
                        ),
                        RecentItemCard(
                            image: Image.asset(
                              Helper.getAssetName("coffee.jpg"),
                              fit: BoxFit.cover,
                            ),
                            name: "Barita"),
                        RecentItemCard(
                            image: Image.asset(
                              Helper.getAssetName("pizza.jpg"),
                              fit: BoxFit.cover,
                            ),
                            name: "Pizza Rush Hour"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecentItemCard extends StatelessWidget {
  const RecentItemCard({
    Key? key,
    required String name,
    required Image image,
  })  : _name = name,
        _image = image,
        super(key: key);

  final String _name;
  final Image _image;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 80,
            height: 80,
            child: _image,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _name,
                  style: Helper.getTheme(context)
                      .headline4
                      ?.copyWith(color: AppColor.primary),
                ),
                Row(
                  children: [
                    Text("Cafe"),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        ".",
                        style: TextStyle(
                          color: AppColor.red,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Western Food"),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                Row(
                  children: [
                    // Image.asset(
                    //   Helper.getAssetName("star_filled.png"),
                    // ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "4.9",
                      style: TextStyle(
                        color: AppColor.red,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text('(124) Ratings')
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class MostPopularCard extends StatelessWidget {
  const MostPopularCard({
    Key? key,
    required String name,
    required Image image,
  })  : _name = name,
        _image = image,
        super(key: key);

  final String _name;
  final Image _image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 300,
            height: 200,
            child: _image,
          ),
        ),
        SizedBox(height: 10),
        Text(
          _name,
          style: Helper.getTheme(context)
              .headline4
              ?.copyWith(color: AppColor.primary),
        ),
        Row(
          children: [
            Text("Cafe"),
            SizedBox(
              width: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                ".",
                style: TextStyle(
                  color: AppColor.red,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text("Western Food"),
            SizedBox(
              width: 20,
            ),
            // Image.asset(
            //   Helper.getAssetName("star_filled.png"),
            // ),
            SizedBox(
              width: 5,
            ),
            Text(
              "4.9",
              style: TextStyle(
                color: AppColor.red,
              ),
            )
          ],
        )
      ],
    );
  }
}

class ItemMenuCard extends StatelessWidget {
  const ItemMenuCard({
    Key? key,
    required String name,
    required Image image,
    required String selectedCategory,
  })  : _image = image,
        _name = name,
        _selectedCategory = selectedCategory,
        super(key: key);

  final String _name;
  final Image _image;
  final String _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Constants.height * 0.35,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: Constants.height * 0.2,
            width: double.infinity,
            child: _image,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: Constants.width * 0.9,
                      child: Text(
                        _name,
                        style: Helper.getTheme(context).headline4,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColor.red,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "4.9",
                      style: TextStyle(
                        color: AppColor.red,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("(124 ratings)"),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Cafe"),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        ".",
                        style: TextStyle(
                          color: AppColor.red,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(_selectedCategory),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Future getapidata(String url) async {
  return await ApiService().getCategoryList(url);
}
