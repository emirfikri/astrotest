import 'package:flutter/material.dart';

class BuildInitialText extends StatelessWidget {
  const BuildInitialText({
    Key? key,
    required this.category,
  }) : super(key: key);

  final String category;

  @override
  Widget build(BuildContext context) => Center(
        child: Text(category == "Food"
            ? "No Category Selected"
            : "Drinks is unavailable"),
      );
}
