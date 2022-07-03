// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../helper/colors.dart';
import '../../../helper/constants.dart';

class IndividualItemBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndividualItemBodyState();
  }
}

class _IndividualItemBodyState extends State<IndividualItemBody>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  static const List<Widget> _tabs = [
    Center(child: Text("Ingredients")),
    Center(child: Text("Steps")),
    Center(child: Text("Nutrition")),
  ];

  static const List<Widget> _views = [
    Center(child: Text('Content of Tab One')),
    Center(child: Text('Content of Tab Two')),
    Center(child: Text('Content of Tab Three')),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: Constants.height * 0.05,
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: Constants.width * 0.05),
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
            ),
            Expanded(
              child: Container(
                height: Constants.height,
                child: TabBarView(
                  physics: BouncingScrollPhysics(),
                  children: _views,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
