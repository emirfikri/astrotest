import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock {}

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) {
    return pumpWidget(
      RepositoryProvider.value(
        value: MockRepository(),
        child: MaterialApp(
          localizationsDelegates: const [],
          home: Scaffold(body: widget),
        ),
      ),
    );
  }

  Future<void> pumpRoute(Route<dynamic> route) {
    return pumpApp(
      Navigator(onGenerateRoute: (_) => route),
    );
  }
}
