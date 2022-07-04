import 'package:flutter/material.dart';

import '../../../helper/colors.dart';
import '../../../helper/helper.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required Image image,
    required String name,
  })  : _image = image,
        _name = name,
        super(key: key);

  final String _name;
  final Image _image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
          width: 100,
          height: 100,
          child: _image,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          _name,
          style: Helper.getTheme(context).headline4?.copyWith(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
