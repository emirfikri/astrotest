// ignore: file_names
import 'package:flutter/material.dart';

import '../../../configs/helper/helper.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Menu",
            style: Helper.getTheme(context).headline5,
          ),
          const Icon(Icons.shopping_cart)
        ],
      ),
    );
  }
}
