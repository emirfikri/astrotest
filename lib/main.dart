import 'package:flutter/material.dart';
import 'app/app.dart';
import 'app/app_bloc_observer.dart';
import 'individual/bloc/bloc_export.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const App()),
    blocObserver: AppBlocObserver(),
  );
}
