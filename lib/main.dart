import 'package:flutter/material.dart';

import 'screens/homescreen/homeScreen.dart';
import 'screens/splashscreen/animatedsplashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(
              category: 'food',
            ),
      },
    );
  }
}
