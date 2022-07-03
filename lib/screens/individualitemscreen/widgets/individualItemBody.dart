// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'individualItemSteps.dart';
import 'package:flutter/material.dart';

import '../../../helper/colors.dart';
import '../../../helper/constants.dart';
import 'individualItemIngredient.dart';

class IndividualItemBody extends StatefulWidget {
  final List ingredients;
  final String? steps;
  const IndividualItemBody({Key? key, required this.ingredients, this.steps})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _IndividualItemBodyState();
  }
}

class _IndividualItemBodyState extends State<IndividualItemBody>
    with TickerProviderStateMixin {
  String steps = "";
  List ingredients = [];
  @override
  void initState() {
    steps = widget.steps ?? "";
    if (steps != "") {
      _views[1] = IndividualSteps(
        steps: steps,
      );
    }
    ingredients = widget.ingredients;
    print("ingredients=== $ingredients");

    super.initState();
  }

  final List<Widget> _tabs = [
    Center(child: Text("Ingredients")),
    Center(child: Text("Steps")),
    Center(child: Text("Nutrition")),
  ];

  final List<Widget> _views = [
    Text(""),
    Text(""),
    Text(
      'Content of Tab Three',
      textAlign: TextAlign.center,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    _views[0] = IndividualItemIngredient(ingredients: ingredients);
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          thisTabbar(),
          SizedBox(
            height: Constants.height * 0.01,
          ),
          Expanded(
            child: TabBarView(
              physics: BouncingScrollPhysics(),
              children: _views,
            ),
          ),
        ],
      ),
    );
  }

  thisTabbar() {
    return Container(
      height: Constants.height * 0.05,
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.05),
        margin: EdgeInsets.only(top: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorColor: AppColor.lightred,
            indicatorSize: TabBarIndicatorSize.tab,
            // indicatorPadding: const EdgeInsets.all(10),
            indicator: BoxDecoration(
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(5),
              color: AppColor.lightred,
            ),
            physics: BouncingScrollPhysics(),
            onTap: (int index) {
              print('Tab $index is tapped');
            },
            enableFeedback: true,
            tabs: _tabs,
          ),
        ),
      ),
    );
  }
}
