import 'package:flutter/material.dart';

class IndividualItemImageHeader extends StatelessWidget {
  final String image;
  const IndividualItemImageHeader({Key? key, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Image.network(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
