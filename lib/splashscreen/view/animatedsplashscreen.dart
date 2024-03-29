import 'dart:async';
import '../../../configs/size_config.dart';
import 'package:flutter/material.dart';

import '../../menu/menu_page.dart';

// ignore: use_key_in_widget_constructors
class AnimatedSplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  var _visible = true;
  late AnimationController animationController;
  late Animation<double> animation;
  late Duration duration;
  startTime() async {
    duration = const Duration(seconds: 2);
    return Timer(duration, navigationPage);
  }

  Future<void> navigationPage() async {
    Navigator.pushReplacement(context, MenuScreen.route());
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    // initialise();
    startTime();
  }

  @override
  void dispose() {
    animationController.dispose();
    animation.isDismissed;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/Icon-192.png',
                width: animation.value * 150,
                height: animation.value * 150,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => false;
}
