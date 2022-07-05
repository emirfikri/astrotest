// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../helper/colors.dart';
import '../../../helper/constants.dart';

class IndividualItemIngredient extends StatefulWidget {
  final List ingredients;
  final List ingredientsmeasure;
  const IndividualItemIngredient(
      {Key? key, required this.ingredients, required this.ingredientsmeasure})
      : super(key: key);

  @override
  State<IndividualItemIngredient> createState() =>
      _IndividualItemIngredientState();
}

class _IndividualItemIngredientState extends State<IndividualItemIngredient> {
  int count = 1;
  String ingredientLink = "https://www.themealdb.com/images/ingredients/";
  List imageUrl = [];
  List ingredientsmeasure = [];
  List measurementtype = [];
  List measurementnumber = [];
  List originalMeasurement = [];
  int nonumberingredients = 1;
  @override
  void initState() {
    getIngredientImage();
    countIngredients();
    super.initState();
  }

  countIngredients() {
    ingredientsmeasure = widget.ingredientsmeasure;
    print(ingredientsmeasure);
    for (var element in ingredientsmeasure) {
      if (element.toString().isNotEmpty && element != null) {
        RegExp removenumber = RegExp(r"[\d\/\ \-]");
        var newmeasurementtype =
            element.toString().replaceAll(removenumber, '');
        measurementtype.add(newmeasurementtype);

        //take number of count unit
        int? intValue = int.tryParse(element.replaceAll(RegExp(r'[^0-9]'), ''));
        measurementnumber.add(intValue);
        originalMeasurement.add(intValue); //original quantity for addon
      }
    }
  }

  getIngredientImage() {
    if (widget.ingredients != []) {
      for (var element in widget.ingredients) {
        if (element != null && element != "") {
          imageUrl.add("$ingredientLink$element-Small.png");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(
          left: Constants.width * 0.05,
          right: Constants.width * 0.05,
        ),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Constants.height * 0.01,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ingredients For",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("$count servings"),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        count++;
                        nonumberingredients++;
                        for (var i = 0; i < measurementnumber.length; i++) {
                          if (measurementnumber[i] != null) {
                            measurementnumber[i] =
                                measurementnumber[i] + originalMeasurement[i];
                          }
                        }
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: mydecoration,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "$count",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (count != 1) {
                        setState(() {
                          for (var i = 0; i < measurementnumber.length; i++) {
                            if (measurementnumber[i] != null) {
                              measurementnumber[i] =
                                  measurementnumber[i] - originalMeasurement[i];
                            }
                          }
                          count--;
                          nonumberingredients--;
                        });
                      }
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: mydecoration,
                      child: Center(
                        child: Text(
                          "-",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                color: Colors.grey,
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: widget.ingredients.length,
                  itemBuilder: (context, index) {
                    return widget.ingredients[index] != "" &&
                            widget.ingredients[index] != null
                        ? Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: Offset(0,
                                              1), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Image.network(
                                      imageUrl[index],
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),
                                  SizedBox(
                                    width: Constants.width * 0.05,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.ingredients[index],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: Constants.height * 0.01,
                                      ),
                                      // ${widget.ingredientsmeasure[index]}
                                      Text(measurementnumber[index] != null
                                          ? "${measurementnumber[index]} ${measurementtype[index]}"
                                          : "$nonumberingredients ${measurementtype[index]}"),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Constants.height * 0.01,
                              ),
                              Divider(
                                color: Colors.grey[350],
                              ),
                            ],
                          )
                        : SizedBox();
                  }),
              SizedBox(
                height: Constants.height * 0.3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  var mydecoration = BoxDecoration(
      color: AppColor.lightred,
      borderRadius: BorderRadius.all(Radius.circular(50)));
}
