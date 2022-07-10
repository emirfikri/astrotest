import 'package:astrotest/app/app.dart';
import 'package:astrotest/configs/helper/constants.dart';
import 'package:astrotest/menu/view/menuScreen.dart';
import 'package:astrotest/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/pump_app.dart';

void main() {
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
  });

  group('App', () {
    testWidgets('renders AppView', (tester) async {
      await tester.pumpWidget(
        const App(),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byType(App), findsOneWidget);
    });
  });

  group('AppView', () {
    testWidgets('renders MaterialApp with correct themes', (tester) async {
      await tester.pumpWidget(
        RepositoryProvider.value(
          value: mockRepository,
          child: const App(),
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byType(MaterialApp), findsOneWidget);

      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.theme, equals(MyTheme.light));
      expect(materialApp.darkTheme, equals(MyTheme.dark));
    });

    testWidgets('renders MenuScreen', (tester) async {
      var mediaQueryData = const MediaQueryData();
      Constants.height = mediaQueryData.size.height;
      Constants.width = mediaQueryData.size.width;
      Widget testWidget = MediaQuery(
          data: const MediaQueryData(), child: MaterialApp(home: MenuScreen()));
      await tester.pumpWidget(
        RepositoryProvider.value(
          value: mockRepository,
          child: testWidget,
        ),
      );

      expect(find.byType(MenuScreen), findsOneWidget);
    });
  });
}
