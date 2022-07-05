import 'package:flutter/material.dart';
import 'blocs/bloc_export.dart';
import 'screens/homescreen/homeScreen.dart';
import 'screens/splashscreen/animatedsplashscreen.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemdetailsBloc(id: ''),
      child: MaterialApp(
        title: 'Astro Test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AnimatedSplashScreen(),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(
                category: 'food',
              ),
        },
      ),
    );
  }
}
