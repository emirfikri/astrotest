import 'package:flutter/material.dart';

import '../../../helper/constants.dart';

class IndividualSteps extends StatelessWidget {
  final String steps;
  const IndividualSteps({Key? key, required this.steps}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Constants.width * 0.03,
          right: Constants.width * 0.03,
          bottom: Constants.height * 0.08),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Text("$steps "),
      ),
    );
  }
}
