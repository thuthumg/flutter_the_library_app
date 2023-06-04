import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/data/vos/shelves_vo.dart';
import 'package:flutter_the_library_app/main.dart';
import 'package:flutter_the_library_app/pages/app_main_page.dart';
import 'package:flutter_the_library_app/persistence/hive_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:integration_test/integration_test.dart';

import 'test_data/test_data.dart';

void main() async{
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();


  await Hive.initFlutter();

  Hive.registerAdapter(BookVOAdapter());
  Hive.registerAdapter(ShelvesVOAdapter());

  await Hive.openBox<BookVO>(BOX_NAME_BOOK_VO);
  await Hive.openBox<ShelvesVO>(BOX_NAME_SHELVES_VO);


  testWidgets("Search Function", (widgetTester) async{
    await widgetTester.pumpWidget(MyApp());
    await Future.delayed(Duration(seconds: 2));

    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    expect(find.byType(AppMainPage), findsOneWidget);
    expect(find.text(TEST_DATA_SEARCH_BUTTON_TXT), findsOneWidget);
  //  expect(find.byType(SearchPage), findsOneWidget);


    await widgetTester.tap(find.text(TEST_DATA_SEARCH_BUTTON_TXT));
    await widgetTester.pumpAndSettle(Duration(seconds: 5));

    expect(find.text(TEST_DATA_SEARCH_BUTTON_TXT), findsOneWidget);
    await widgetTester.enterText(find.byKey(Key('myTextField')), 'Android');
    await widgetTester.pumpAndSettle(Duration(seconds: 5));

    expect(find.text(TEST_DATA_SEARCH_RESULT_FIRST_BOOK_NAME), findsOneWidget);
    expect(find.text(TEST_DATA_SEARCH_RESULT_SECOND_BOOK_NAME), findsOneWidget);

    await widgetTester.pumpAndSettle(Duration(seconds: 5));

    await widgetTester.tap(find.text(TEST_DATA_SEARCH_RESULT_FIRST_BOOK_NAME));

    await widgetTester.pumpAndSettle(Duration(seconds: 2));


    await widgetTester.tap(find.byKey(Key('backIconFromDetailPage')));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    expect(find.text(TEST_DATA_SEARCH_RESULT_FIRST_BOOK_NAME), findsOneWidget);

    await widgetTester.tap(find.byKey(Key('backIconFromSearchPage')));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));







  });
}