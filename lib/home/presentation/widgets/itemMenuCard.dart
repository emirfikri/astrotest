// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../configs/helper/colors.dart';
import '../../../configs/helper/constants.dart';

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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
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
