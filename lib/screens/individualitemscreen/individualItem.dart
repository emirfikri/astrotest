// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !isLoading
          ? Stack(
              children: [
                SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                // height: Constants.height * 0.3,
                                width: Constants.width,
                                child: Image.network(
                                  detailsItem.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SafeArea(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                        height: Constants.height * 0.15,
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
                                          child: Icon(Icons.play_arrow)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SafeArea(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Constants.height * 0.3,
                                ),
                                SizedBox(
                                    height: Constants.height * 0.1,
                                    width: double.infinity,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.8),
                                            spreadRadius: 10,
                                            blurRadius: 5,
                                            offset: Offset(0, 7),
                                          ),
                                        ],
                                      ),
                                      child: Text("e"),
                                    )),
                                SizedBox(
                                  height: Constants.height,
                                  width: double.infinity,
                                  child: Stack(
                                    children: [
                                      IndividualItemBody(),
                                      // Padding(
                                      //   padding: const EdgeInsets.only(top: 30.0),
                                      //   child: Container(
                                      //     height: 800,
                                      //     width: double.infinity,
                                      //     padding: const EdgeInsets.symmetric(
                                      //         vertical: 30),
                                      //     decoration: ShapeDecoration(
                                      //       color: Colors.white,
                                      //       shape: RoundedRectangleBorder(
                                      //         borderRadius: BorderRadius.only(
                                      //           topLeft: Radius.circular(15),
                                      //           topRight: Radius.circular(15),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     child: Column(
                                      //       crossAxisAlignment:
                                      //           CrossAxisAlignment.start,
                                      //       children: [
                                      //         Padding(
                                      //           padding: const EdgeInsets.symmetric(
                                      //               horizontal: 20),
                                      //           child: Text(
                                      //             "Tandoori Chicken Pizza",
                                      //             style: Helper.getTheme(context)
                                      //                 .headline5,
                                      //           ),
                                      //         ),
                                      //         Padding(
                                      //           padding: const EdgeInsets.symmetric(
                                      //               horizontal: 20),
                                      //           child: Row(
                                      //             crossAxisAlignment:
                                      //                 CrossAxisAlignment.start,
                                      //             children: [
                                      //               Column(
                                      //                 crossAxisAlignment:
                                      //                     CrossAxisAlignment.start,
                                      //                 children: [
                                      //                   Row(
                                      //                     children: [
                                      //                       Icon(
                                      //                         Icons.star,
                                      //                         color: AppColor.red,
                                      //                       ),
                                      //                       SizedBox(
                                      //                         width: 8,
                                      //                       ),
                                      //                       Image.network(
                                      //                         detailsItem.image,
                                      //                         height: 100,
                                      //                       ),
                                      //                       SizedBox(
                                      //                         width: 8,
                                      //                       ),
                                      //                       Icon(Icons.star),
                                      //                       SizedBox(
                                      //                         width: 8,
                                      //                       ),
                                      //                       Icon(Icons.star),
                                      //                       SizedBox(
                                      //                         width: 8,
                                      //                       ),
                                      //                       Icon(Icons.star),
                                      //                       SizedBox(
                                      //                         width: 8,
                                      //                       ),
                                      //                     ],
                                      //                   ),
                                      //                   SizedBox(
                                      //                     height: 5,
                                      //                   ),
                                      //                   Text(
                                      //                     "4 Star Ratings",
                                      //                     style: TextStyle(
                                      //                       color: AppColor.red,
                                      //                       fontSize: 12,
                                      //                     ),
                                      //                   )
                                      //                 ],
                                      //               ),
                                      //               Expanded(
                                      //                 child: Column(
                                      //                   crossAxisAlignment:
                                      //                       CrossAxisAlignment.end,
                                      //                   children: [
                                      //                     SizedBox(
                                      //                       height: 20,
                                      //                     ),
                                      //                     Text(
                                      //                       "Rs. 750",
                                      //                       style: TextStyle(
                                      //                         color: AppColor.primary,
                                      //                         fontSize: 30,
                                      //                         fontWeight:
                                      //                             FontWeight.w700,
                                      //                       ),
                                      //                     ),
                                      //                     Text("/per Portion")
                                      //                   ],
                                      //                 ),
                                      //               )
                                      //             ],
                                      //           ),
                                      //         ),
                                      //         Padding(
                                      //           padding: const EdgeInsets.symmetric(
                                      //               horizontal: 20),
                                      //           child: Text(
                                      //             "Description",
                                      //             style: Helper.getTheme(context)
                                      //                 .headline4
                                      //                 ?.copyWith(
                                      //                   fontSize: 16,
                                      //                 ),
                                      //           ),
                                      //         ),
                                      //         SizedBox(
                                      //           height: 10,
                                      //         ),
                                      //         Padding(
                                      //           padding: const EdgeInsets.symmetric(
                                      //               horizontal: 20),
                                      //           child: Text(
                                      //               "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare leo non mollis id cursus. Eu euismod faucibus in leo malesuada"),
                                      //         ),
                                      //         SizedBox(
                                      //           height: 20,
                                      //         ),
                                      //         Padding(
                                      //           padding: const EdgeInsets.symmetric(
                                      //               horizontal: 20),
                                      //           child: Divider(
                                      //             color: AppColor.placeholder,
                                      //             thickness: 1.5,
                                      //           ),
                                      //         ),
                                      //         SizedBox(
                                      //           height: 10,
                                      //         ),
                                      //         Padding(
                                      //           padding: const EdgeInsets.symmetric(
                                      //               horizontal: 20),
                                      //           child: Text(
                                      //             "Customize your Order",
                                      //             style: Helper.getTheme(context)
                                      //                 .headline4
                                      //                 ?.copyWith(
                                      //                   fontSize: 16,
                                      //                 ),
                                      //           ),
                                      //         ),
                                      //         SizedBox(
                                      //           height: 10,
                                      //         ),
                                      //         Padding(
                                      //           padding: const EdgeInsets.symmetric(
                                      //               horizontal: 20),
                                      //           child: Container(
                                      //             height: 50,
                                      //             width: double.infinity,
                                      //             padding: const EdgeInsets.only(
                                      //                 left: 30, right: 10),
                                      //             decoration: ShapeDecoration(
                                      //               shape: RoundedRectangleBorder(
                                      //                 borderRadius:
                                      //                     BorderRadius.circular(5),
                                      //               ),
                                      //               color: AppColor.placeholderBg,
                                      //             ),
                                      //             child: DropdownButtonHideUnderline(
                                      //               child: DropdownButton(
                                      //                 hint: Row(
                                      //                   children: [
                                      //                     Text(
                                      //                         "-Select the size of portion-"),
                                      //                   ],
                                      //                 ),
                                      //                 value: "default",
                                      //                 onChanged: (_) {},
                                      //                 items: [
                                      //                   DropdownMenuItem(
                                      //                     child: Text(
                                      //                         "-Select the size of portion-"),
                                      //                     value: "default",
                                      //                   ),
                                      //                 ],
                                      //                 icon:
                                      //                     Icon(Icons.arrow_downward),
                                      //               ),
                                      //             ),
                                      //           ),
                                      //         ),
                                      //         SizedBox(
                                      //           height: 5,
                                      //         ),
                                      //         Padding(
                                      //           padding: const EdgeInsets.symmetric(
                                      //               horizontal: 20),
                                      //           child: Container(
                                      //             height: 50,
                                      //             width: double.infinity,
                                      //             padding: const EdgeInsets.only(
                                      //                 left: 30, right: 10),
                                      //             decoration: ShapeDecoration(
                                      //               shape: RoundedRectangleBorder(
                                      //                 borderRadius:
                                      //                     BorderRadius.circular(5),
                                      //               ),
                                      //               color: AppColor.placeholderBg,
                                      //             ),
                                      //             child: DropdownButtonHideUnderline(
                                      //               child: DropdownButton(
                                      //                   hint: Row(
                                      //                     children: [
                                      //                       Text(
                                      //                           "-Select the ingredients-"),
                                      //                     ],
                                      //                   ),
                                      //                   value: "default",
                                      //                   onChanged: (_) {},
                                      //                   items: [
                                      //                     DropdownMenuItem(
                                      //                       child: Text(
                                      //                           "-Select the ingredients-"),
                                      //                       value: "default",
                                      //                     ),
                                      //                   ],
                                      //                   icon: Icon(Icons
                                      //                       .keyboard_arrow_down_outlined)),
                                      //             ),
                                      //           ),
                                      //         ),
                                      //         SizedBox(
                                      //           height: 15,
                                      //         ),
                                      //         Padding(
                                      //           padding: const EdgeInsets.symmetric(
                                      //               horizontal: 20),
                                      //           child: Row(
                                      //             children: [
                                      //               Text(
                                      //                 "Number of Portions",
                                      //                 style: Helper.getTheme(context)
                                      //                     .headline4
                                      //                     ?.copyWith(
                                      //                       fontSize: 16,
                                      //                     ),
                                      //               ),
                                      //               Expanded(
                                      //                 child: Row(
                                      //                   mainAxisAlignment:
                                      //                       MainAxisAlignment.end,
                                      //                   children: [
                                      //                     ElevatedButton(
                                      //                       style: ButtonStyle(
                                      //                           elevation:
                                      //                               MaterialStateProperty
                                      //                                   .all(5.0)),
                                      //                       onPressed: () {},
                                      //                       child: Text("-"),
                                      //                     ),
                                      //                     SizedBox(
                                      //                       width: 5,
                                      //                     ),
                                      //                     Container(
                                      //                       height: 35,
                                      //                       width: 55,
                                      //                       decoration:
                                      //                           ShapeDecoration(
                                      //                         shape: StadiumBorder(
                                      //                           side: BorderSide(
                                      //                               color:
                                      //                                   AppColor.red),
                                      //                         ),
                                      //                       ),
                                      //                       child: Row(
                                      //                         mainAxisAlignment:
                                      //                             MainAxisAlignment
                                      //                                 .center,
                                      //                         children: [
                                      //                           Text(
                                      //                             "2",
                                      //                             style: TextStyle(
                                      //                               color:
                                      //                                   AppColor.red,
                                      //                             ),
                                      //                           ),
                                      //                         ],
                                      //                       ),
                                      //                     ),
                                      //                     SizedBox(
                                      //                       width: 5,
                                      //                     ),
                                      //                     ElevatedButton(
                                      //                       style: ButtonStyle(
                                      //                           elevation:
                                      //                               MaterialStateProperty
                                      //                                   .all(5.0)),
                                      //                       onPressed: () {},
                                      //                       child: Text("+"),
                                      //                     ),
                                      //                   ],
                                      //                 ),
                                      //               ),
                                      //             ],
                                      //           ),
                                      //         ),
                                      //         SizedBox(
                                      //           height: 200,
                                      //           width: double.infinity,
                                      //           child: Stack(
                                      //             children: [
                                      //               Container(
                                      //                 width: 120,
                                      //                 decoration: ShapeDecoration(
                                      //                   color: AppColor.red,
                                      //                   shape: RoundedRectangleBorder(
                                      //                     borderRadius:
                                      //                         BorderRadius.only(
                                      //                       topRight:
                                      //                           Radius.circular(40),
                                      //                       bottomRight:
                                      //                           Radius.circular(40),
                                      //                     ),
                                      //                   ),
                                      //                 ),
                                      //               ),
                                      //               Align(
                                      //                 alignment:
                                      //                     Alignment.centerRight,
                                      //                 child: Padding(
                                      //                   padding: const EdgeInsets
                                      //                       .symmetric(
                                      //                     horizontal: 20,
                                      //                   ),
                                      //                   child: Container(
                                      //                     height: 160,
                                      //                     width: double.infinity,
                                      //                     margin:
                                      //                         const EdgeInsets.only(
                                      //                       left: 50,
                                      //                       right: 40,
                                      //                     ),
                                      //                     decoration: ShapeDecoration(
                                      //                       shape:
                                      //                           RoundedRectangleBorder(
                                      //                         borderRadius:
                                      //                             BorderRadius.only(
                                      //                           topLeft:
                                      //                               Radius.circular(
                                      //                                   40),
                                      //                           bottomLeft:
                                      //                               Radius.circular(
                                      //                                   40),
                                      //                           topRight:
                                      //                               Radius.circular(
                                      //                                   10),
                                      //                           bottomRight:
                                      //                               Radius.circular(
                                      //                                   10),
                                      //                         ),
                                      //                       ),
                                      //                       shadows: [
                                      //                         BoxShadow(
                                      //                           color: AppColor
                                      //                               .placeholder
                                      //                               .withOpacity(0.3),
                                      //                           offset: Offset(0, 5),
                                      //                           blurRadius: 5,
                                      //                         ),
                                      //                       ],
                                      //                       color: Colors.white,
                                      //                     ),
                                      //                     child: Column(
                                      //                       mainAxisAlignment:
                                      //                           MainAxisAlignment
                                      //                               .center,
                                      //                       children: [
                                      //                         Text(
                                      //                           "Total Price",
                                      //                         ),
                                      //                         SizedBox(
                                      //                           height: 10,
                                      //                         ),
                                      //                         Text(
                                      //                           "LKR 1500",
                                      //                           style: TextStyle(
                                      //                             color: AppColor
                                      //                                 .primary,
                                      //                             fontWeight:
                                      //                                 FontWeight.bold,
                                      //                             fontSize: 20,
                                      //                           ),
                                      //                         ),
                                      //                         SizedBox(height: 10),
                                      //                         SizedBox(
                                      //                           width: 200,
                                      //                           child: ElevatedButton(
                                      //                               onPressed: () {},
                                      //                               child: Row(
                                      //                                 mainAxisAlignment:
                                      //                                     MainAxisAlignment
                                      //                                         .center,
                                      //                                 children: [
                                      //                                   Icon(Icons
                                      //                                       .shopping_cart),
                                      //                                   Text(
                                      //                                     "Add to Cart",
                                      //                                   )
                                      //                                 ],
                                      //                               )),
                                      //                         )
                                      //                       ],
                                      //                     ),
                                      //                   ),
                                      //                 ),
                                      //               ),
                                      //               Padding(
                                      //                 padding: const EdgeInsets.only(
                                      //                   right: 20,
                                      //                 ),
                                      //                 child: Align(
                                      //                   alignment:
                                      //                       Alignment.centerRight,
                                      //                   child: Container(
                                      //                     width: 60,
                                      //                     height: 60,
                                      //                     decoration: ShapeDecoration(
                                      //                       color: Colors.white,
                                      //                       shadows: [
                                      //                         BoxShadow(
                                      //                           color: AppColor
                                      //                               .placeholder
                                      //                               .withOpacity(0.3),
                                      //                           offset: Offset(0, 5),
                                      //                           blurRadius: 5,
                                      //                         ),
                                      //                       ],
                                      //                       shape: CircleBorder(),
                                      //                     ),
                                      //                     child: Icon(Icons
                                      //                         .shopping_cart_checkout),
                                      //                   ),
                                      //                 ),
                                      //               ),
                                      //             ],
                                      //           ),
                                      //         )
                                      //       ],
                                      //     ),
                                      //   ),
                                      // ),
                                      // Padding(
                                      //   padding: const EdgeInsets.only(
                                      //     right: 20,
                                      //   ),
                                      //   child: Align(
                                      //     alignment: Alignment.topRight,
                                      //     child: Container(
                                      //         width: 60,
                                      //         height: 60,
                                      //         color: Colors.white,
                                      //         child: Icon(Icons.star)),
                                      //   ),
                                      // )
                                    ],
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
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
