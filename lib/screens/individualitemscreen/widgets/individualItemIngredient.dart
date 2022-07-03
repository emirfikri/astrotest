// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import '../../../helper/colors.dart';
import '../../../helper/constants.dart';
import '../../../helper/helper.dart';

class IndividualItemIngredient extends StatefulWidget {
  final List ingredients;
  const IndividualItemIngredient({Key? key, required this.ingredients})
      : super(key: key);

  @override
  State<IndividualItemIngredient> createState() =>
      _IndividualItemIngredientState();
}

class _IndividualItemIngredientState extends State<IndividualItemIngredient> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.05),
      margin: EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                      count--;
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
        ],
      ),
    );
  }

  var mydecoration = BoxDecoration(
      color: AppColor.lightred,
      borderRadius: BorderRadius.all(Radius.circular(50)));
}
