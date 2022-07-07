import 'package:flutter/material.dart';

import '../../../configs/helper/constants.dart';

class IndividualSteps extends StatelessWidget {
  final String steps;
  const IndividualSteps({Key? key, required this.steps}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Constants.width * 0.03,
        right: Constants.width * 0.03,
      ),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Text("$steps "),
            SizedBox(
              height: Constants.height * 0.3,
            ),
          ],
        ),
      ),
    );
  }
}
