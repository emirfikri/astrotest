import 'package:flutter/material.dart';

import '../../../helper/constants.dart';

class IndividualSteps extends StatelessWidget {
  final String steps;
  const IndividualSteps({Key? key, required this.steps}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.05),
        child: Text("$steps   $steps   $steps $steps"));
  }
}
