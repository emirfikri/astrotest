// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:astrotest/screens/individualitemscreen/widgets/individualItemHeaderImage.dart';

import '../../model/fooddetails_model.dart';
import '../../helper/colors.dart';
import '../../helper/constants.dart';
import 'package:flutter/material.dart';

import '../../helper/helper.dart';
import '../homescreen/homeScreen.dart';
import 'widgets/individualItemBody.dart';
import 'widgets/individualItemBottomButton.dart';

class IndividualItemDetails extends StatefulWidget {
  final String category;
  final String itemId;
  const IndividualItemDetails(
      {Key? key, required this.category, required this.itemId})
      : super(key: key);

  @override
  State<IndividualItemDetails> createState() => _IndividualItemDetailsState();
}

class _IndividualItemDetailsState extends State<IndividualItemDetails> {
  var detailsItem;
  bool isLoading = true;
  @override
  void initState() {
    getDetailsId();
    super.initState();
  }

  getDetailsId() async {
    var detailsItem1;
    var rawdata = await getapidata(
        "https://www.themealdb.com/api/json/v1/1/lookup.php?i=${widget.itemId}");
    var responseData = rawdata['meals'];
    detailsItem1 =
        responseData.map((e) => FoodDetailsModel.fromJson(e)).toList();
    setState(() {
      detailsItem = detailsItem1[0];
      isLoading = false;
    });
  }

  imageHeaderButton() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Constants.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.black,
                ),
                Text("4.5"),
                Icon(
                  Icons.do_not_disturb_on,
                  size: 5,
                ),
                Text("15:06"),
              ],
            ),
            SizedBox(
              height: Constants.height * 0.1,
            ),
            Container(
              decoration: ShapeDecoration(
                color: AppColor.lightred,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              height: Constants.height * 0.05,
              width: Constants.height * 0.05,
              child: Icon(Icons.play_arrow),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: !isLoading
          ? SingleChildScrollView(
              child: Stack(
                children: [
                  IndividualItemImageHeader(
                    image: detailsItem.image,
                  ),
                  imageHeaderButton(),
                  SafeArea(
                    child: Column(
                      children: [
                        SizedBox(
                          height: Constants.height * 0.3,
                        ),
                        BottomButton(),
                        Container(
                          color: Colors.white,
                          height: Constants.height * 0.7,
                          width: double.infinity,
                          child: IndividualItemBody(
                            ingredients: detailsItem.ingredients,
                            steps: detailsItem.instructions,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
