// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import '../../model/fooddetails_model.dart';
import '../../helper/colors.dart';
import '../../helper/constants.dart';
import 'package:flutter/material.dart';

import '../../helper/helper.dart';
import '../homescreen/homeScreen.dart';
import 'widgets/individualItemBody.dart';

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
  bool isStar = false;
  bool isBookmark = false;
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

  imageHeader() {
    return SizedBox(
      width: double.infinity,
      child: Image.network(
        detailsItem.image,
        fit: BoxFit.cover,
      ),
    );
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
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Stack(
                    children: [
                      imageHeader(),
                      imageHeaderButton(),
                      SafeArea(
                        child: Column(
                          children: [
                            SizedBox(
                              height: Constants.height * 0.3,
                            ),
                            Container(
                              height: Constants.height * 0.08,
                              width: double.infinity,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(0, 0),
                                    ),
                                  ],
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.chat_outlined),
                                        Text(
                                          "350",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isStar = !isStar;
                                            });
                                          },
                                          child: isStar
                                              ? Icon(
                                                  Icons.star,
                                                  color: AppColor.lightred,
                                                )
                                              : Icon(
                                                  Icons.star_border,
                                                ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isBookmark = !isBookmark;
                                            });
                                          },
                                          child: isBookmark
                                              ? Icon(
                                                  Icons.bookmark_added,
                                                  color: AppColor.lightred,
                                                )
                                              : Icon(
                                                  Icons.bookmark_border_rounded,
                                                ),
                                        ),
                                        GestureDetector(
                                          child: Icon(
                                            Icons.share_outlined,
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                            Container(
                              height: Constants.height,
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
                  SizedBox(
                    height: 10,
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
