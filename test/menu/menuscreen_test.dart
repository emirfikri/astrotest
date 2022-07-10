import 'package:astrotest/configs/helper/constants.dart';
import 'package:astrotest/menu/view/menuScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/pump_app.dart';

void main() {
  late MockRepository mockRepository;
  var mediaQueryData = const MediaQueryData();
  Constants.height = mediaQueryData.size.height;
  Constants.width = mediaQueryData.size.width;

  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    mockRepository = MockRepository();
  });
  group('HomeCubit', () {
    MenuScreen buildCubit() => MenuScreen();

    group('constructor', () {
      test('works properly', () {
        expect(buildCubit, returnsNormally);
      });
      testWidgets('renders MenuScreen', (tester) async {
        Widget testWidget = MediaQuery(
            data: const MediaQueryData(),
            child: MaterialApp(home: MenuScreen()));
        await tester.pumpWidget(
          RepositoryProvider.value(
            value: mockRepository,
            child: testWidget,
          ),
        );
        expect(find.byType(MenuScreen), findsOneWidget);
      });
    });
  });
}
