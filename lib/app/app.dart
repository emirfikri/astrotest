import 'package:flutter/material.dart';

import '../splashscreen/view/view.dart';
import '../theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astro Test',
      theme: MyTheme.light,
      darkTheme: MyTheme.dark,
      home: AnimatedSplashScreen(),
    );
  }
}
