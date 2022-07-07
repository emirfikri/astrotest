// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../../../configs/helper/constants.dart';

class BottomButton extends StatefulWidget {
  const BottomButton({Key? key}) : super(key: key);

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  bool isStar = false;
  bool isBookmark = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constants.height * 0.08,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }
}
