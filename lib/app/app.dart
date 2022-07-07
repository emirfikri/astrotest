import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/itemdetails/itemdetails_bloc.dart';
import '../splashscreen/view/view.dart';
import '../theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemdetailsBloc(id: ''),
      child: MaterialApp(
        title: 'Astro Test',
        theme: MyTheme.light,
        darkTheme: MyTheme.dark,
        home: AnimatedSplashScreen(),
      ),
    );
  }
}
