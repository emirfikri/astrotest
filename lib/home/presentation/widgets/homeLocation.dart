// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../../configs/helper/helper.dart';

class HomeLocation extends StatelessWidget {
  const HomeLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Text("Deilivering to"),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: DropdownButtonHideUnderline(
            child: SizedBox(
              width: 250,
              child: DropdownButton(
                value: "current location",
                items: [
                  DropdownMenuItem(
                    value: "current location",
                    child: Text(
                      "Current Location",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
                icon: Icon(Icons.keyboard_arrow_down),
                style: Helper.getTheme(context).headline4,
                onChanged: (_) {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
