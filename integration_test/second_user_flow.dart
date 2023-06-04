import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_the_library_app/components/display_and_sorting_view.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/data/vos/shelves_vo.dart';
import 'package:flutter_the_library_app/main.dart';
import 'package:flutter_the_library_app/pages/add_to_shelves_page.dart';
import 'package:flutter_the_library_app/pages/create_shelf_page.dart';
import 'package:flutter_the_library_app/pages/home_page.dart';
import 'package:flutter_the_library_app/persistence/hive_constants.dart';
import 'package:flutter_the_library_app/resources/strings.dart';
import 'package:flutter_the_library_app/widgets/book_shelves_view.dart';
import 'package:flutter_the_library_app/widgets/bottom_sheet_view.dart';
import 'package:flutter_the_library_app/widgets/shelf_action_bottom_sheet_view.dart';

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


  testWidgets("Add To Shelves and delete the book from library", (widgetTester) async{

    await widgetTester.pumpWidget(MyApp());
    await Future.delayed(Duration(seconds: 2));

    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    expect(find.byType(HomePage), findsOneWidget);

    await widgetTester.pumpAndSettle(Duration(seconds: 5));

    expect(find.text(TEST_DATA_CATEGORY_NAME), findsOneWidget);
    expect(find.text(TEST_DATA_FIRST_BOOK_NAME), findsOneWidget);
    expect(find.text(TEST_DATA_SECOND_BOOK_NAME), findsOneWidget);
    expect(find.text(TEST_DATA_THIRD_BOOK_NAME), findsOneWidget);


    ///first book read
    await widgetTester.tap(find.text(TEST_DATA_FIRST_BOOK_NAME));
    await widgetTester.pumpAndSettle(Duration(seconds: 5));
    expect(find.text(TEST_DATA_DETAIL_PAGE_FIRST_BOOK_NAME), findsOneWidget);
    expect(find.text(TEST_DATA_DETAIL_PAGE_FIRST_BOOK_AUTHOR_NAME), findsOneWidget);

    ///detail back btn function
    await widgetTester.tap(find.byKey(Key('backIconFromDetailPage')));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    expect(find.text(TEST_DATA_DETAIL_PAGE_FIRST_BOOK_NAME), findsOneWidget);


    ///second book read
    await widgetTester.tap(find.text(TEST_DATA_SECOND_BOOK_NAME));
    await widgetTester.pumpAndSettle(Duration(seconds: 5));
    expect(find.text(TEST_DATA_DETAIL_PAGE_SECOND_BOOK_NAME), findsOneWidget);
    expect(find.text(TEST_DATA_DETAIL_PAGE_SECOND_BOOK_AUTHOR_NAME), findsOneWidget);
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    await widgetTester.drag(
        find.byKey(Key('bookDetailScrollView')),// widget you want to scroll
        Offset(0.0, -500.0)
    );
    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    ///detail back btn function
    await widgetTester.tap(find.byKey(Key('backIconFromDetailPage')));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    expect(find.text(TEST_DATA_DETAIL_PAGE_FIRST_BOOK_NAME), findsOneWidget);

    ///scroll home page
    await widgetTester.pumpAndSettle(Duration(seconds: 3));
    await widgetTester.drag(
        find.byKey(Key('nestedScrollView')),
        Offset(0.0, -400.0)
    );
    await widgetTester.pumpAndSettle(Duration(seconds: 5));
    expect(find.text('Middle Grade Paperback'), findsOneWidget);

    ///third book read
    await widgetTester.tap(find.text('THE ONE AND ONLY IVAN'));
    await widgetTester.pumpAndSettle(Duration(seconds: 5));
    expect(find.text('THE ONE AND ONLY IVAN'), findsOneWidget);
    expect(find.text('Katherine Applegate.'), findsOneWidget);

    ///detail back function
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    await widgetTester.tap(find.byKey(Key('backIconFromDetailPage')));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    expect(find.text(TEST_DATA_DETAIL_PAGE_FIRST_BOOK_NAME), findsOneWidget);

    ///scroll down on home page
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    await widgetTester.drag(
        find.byKey(Key('nestedScrollView')),
        Offset(0.0, 400.0)
    );
    await widgetTester.pumpAndSettle(Duration(seconds: 5));
    final carouselViewFinder = find.byKey(Key('readBookCarouselSlider')); // Replace with your Carousel View type
    final carouselView = widgetTester.widget<CarouselSlider>(carouselViewFinder); // Replace with your Carousel View type
    final objectData = carouselView.items; // Replace with the appropriate getter for your object data

    expect(objectData, isNotNull);
    expect(objectData?.length, equals(3));


    ///Library
    await widgetTester.tap(find.text('Library'));

    await widgetTester.pumpAndSettle(Duration(seconds: 10));
    expect(find.text(TEST_DATA_FIRST_CATEGORY_NAME), findsOneWidget);
    expect(find.text(TEST_DATA_SECOND_CATEGORY_NAME), findsOneWidget);
    expect(find.text(TEST_DATA_FIRST_READ_BOOK_NAME), findsOneWidget);
    expect(find.text(TEST_DATA_SECOND_READ_BOOK_NAME), findsOneWidget);
    expect(find.text(TEST_DATA_THIRD_READ_BOOK_NAME), findsOneWidget);


    ///Your shelves
    await widgetTester.tap(find.text('Your shelves'));

    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    expect(find.byKey(Key('createNewShelf')), findsOneWidget);
    await widgetTester.tap(find.byKey(Key('createNewShelf')));

    await widgetTester.pumpAndSettle(Duration(seconds: 3));
    expect(find.byType(CreateShelfPage), findsOneWidget);
    await widgetTester.enterText(find.byKey(Key('editTextShelfName')), 'Test');

    // Simulate pressing the Enter key
    await widgetTester.testTextInput.receiveAction(TextInputAction.done);
    await widgetTester.pumpAndSettle(Duration(seconds: 3));

    expect(find.byType(BookShelvesView), findsOneWidget);
    await widgetTester.pumpAndSettle(Duration(seconds: 3));
    expect(find.text('Test'), findsOneWidget);

    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    // final listItemFinder = find.byType(ShelvesListEachItemView); // Replace with the appropriate widget type
    //
    // final List<Widget> listItems = widgetTester.widgetList(listItemFinder).toList();
    // final List<ShelvesVO?> itemShelvesList = listItems.map((widget) {
    //   final itemWidget = widget as ShelvesListEachItemView; // Replace with the appropriate widget type
    //   return itemWidget.shelvesVO;
    // }).toList();
    // print('check title ${itemShelvesList[0]?.shelfId}');
    await widgetTester.tap(find.byType(ShelvesListEachItemView));
    await widgetTester.pumpAndSettle(Duration(seconds: 3));

    //go to create shelf page
    expect(find.byType(CreateShelfPage), findsOneWidget);
    expect(find.text('Test'), findsOneWidget);
     await widgetTester.pumpAndSettle(Duration(seconds: 2));
     await widgetTester.tap(find.byKey(Key('contexturalMenu')));

     await widgetTester.pumpAndSettle(Duration(seconds: 2));
    // // Check if the BottomSheet is visible
     expect(find.byType(ShelfActionBottomSheetView), findsOneWidget);
     await widgetTester.pumpAndSettle(Duration(seconds: 2));
     expect(find.text('Rename shelf'), findsOneWidget);
     expect(find.text('Delete shelf'), findsOneWidget);
     await widgetTester.pumpAndSettle(Duration(seconds: 2));


    await widgetTester.tap(find.text('Rename shelf'));
    await widgetTester.pumpAndSettle(Duration(seconds: 3));
    expect(find.text('Test'), findsOneWidget);
    await widgetTester.enterText(find.byKey(Key('editTextShelfName')), '10 Interaction Design Books to Read');

    // Simulate pressing the Enter key
    await widgetTester.testTextInput.receiveAction(TextInputAction.done);
    await widgetTester.pumpAndSettle(Duration(seconds: 3));

    expect(find.byType(BookShelvesView), findsOneWidget);
    await widgetTester.pumpAndSettle(Duration(seconds: 3));
    expect(find.text('10 Interaction Design Books to Read'), findsOneWidget);

    await widgetTester.tap(find.text('Your books'));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    expect(find.text(TEST_DATA_DETAIL_PAGE_SECOND_BOOK_NAME), findsOneWidget);

    /// add first book to shelf
    //click contextual icon
    final listItemFinder1 = find.byType(ListEachItemView); // Replace with the appropriate widget type

    final List<Widget> listItems1 = widgetTester.widgetList(listItemFinder1).toList();
    final List<BookVO?> itemBooksList1 = listItems1.map((widget) {
      final itemWidget1 = widget as ListEachItemView; // Replace with the appropriate widget type
      return itemWidget1.mBookVO;
    }).toList();
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    await widgetTester.tap(find.byKey(Key('libraryListViewContextualIcon-${itemBooksList1[0]?.bookId}')));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));



    // add to shelves
    // // Check if the BottomSheet is visible
    expect(find.byType(BottomSheetView), findsOneWidget);
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    expect(itemBooksList1[0]?.title, equals(TEST_DATA_FIRST_READ_BOOK_NAME));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    expect(find.text(ADD_TO_SHELVES_TXT), findsOneWidget);
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    await widgetTester.tap(find.text(ADD_TO_SHELVES_TXT));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    //add to shelves list page
    expect(find.byType(AddToShelvesPage), findsOneWidget);
    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    //click check box

    final listItemFinder = find.byType(ShelfCheckBoxListItemView); // Replace with the appropriate widget type

    final List<Widget> listItems = widgetTester.widgetList(listItemFinder).toList();
    final List<ShelvesVO?> itemShelvesList = listItems.map((widget) {
      final itemWidget = widget as ShelfCheckBoxListItemView; // Replace with the appropriate widget type
      return itemWidget.shelvesVO;
    }).toList();
   // print('check title ${itemShelvesList[0]?.shelfId}');
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    await widgetTester.tap(find.byKey(Key('chk-${itemShelvesList[0]?.shelfId}')));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    await widgetTester.tap(find.byKey(Key('closeIcon')));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    expect(find.text('Your books'), findsOneWidget);
    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    await widgetTester.tap(find.text('Your shelves'));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    expect(find.text('1 book'), findsOneWidget);
    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    await widgetTester.tap(find.text('Your books'));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));

/// add second book to shelf
    //click contextual icon
    final listItemFinder2 = find.byType(ListEachItemView); // Replace with the appropriate widget type

    final List<Widget> listItems2 = widgetTester.widgetList(listItemFinder2).toList();
    final List<BookVO?> itemBooksList2 = listItems2.map((widget) {
      final itemWidget2 = widget as ListEachItemView; // Replace with the appropriate widget type
      return itemWidget2.mBookVO;
    }).toList();
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    await widgetTester.tap(find.byKey(Key('libraryListViewContextualIcon-${itemBooksList2[1]?.bookId}')));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));



    // add to shelves
    // // Check if the BottomSheet is visible
    expect(find.byType(BottomSheetView), findsOneWidget);
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    expect(itemBooksList1[1]?.title, equals(TEST_DATA_SECOND_READ_BOOK_NAME));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    expect(find.text(ADD_TO_SHELVES_TXT), findsOneWidget);
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    await widgetTester.tap(find.text(ADD_TO_SHELVES_TXT));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    //add to shelves list page
    expect(find.byType(AddToShelvesPage), findsOneWidget);
    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    //click check box

    final listItemFinder3 = find.byType(ShelfCheckBoxListItemView); // Replace with the appropriate widget type

    final List<Widget> listItems3 = widgetTester.widgetList(listItemFinder3).toList();
    final List<ShelvesVO?> itemShelvesList3 = listItems3.map((widget) {
      final itemWidget3 = widget as ShelfCheckBoxListItemView; // Replace with the appropriate widget type
      return itemWidget3.shelvesVO;
    }).toList();
    // print('check title ${itemShelvesList[0]?.shelfId}');
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    await widgetTester.tap(find.byKey(Key('chk-${itemShelvesList3[0]?.shelfId}')));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    await widgetTester.tap(find.byKey(Key('closeIcon')));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    expect(find.text('Your books'), findsOneWidget);
    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    await widgetTester.tap(find.text('Your shelves'));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    expect(find.text('2 books'), findsOneWidget);
    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    await widgetTester.tap(find.text('Your books'));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));


    /// add third book to shelf
    //click contextual icon
    final listItemFinder4 = find.byType(ListEachItemView); // Replace with the appropriate widget type

    final List<Widget> listItems4 = widgetTester.widgetList(listItemFinder4).toList();
    final List<BookVO?> itemBooksList4 = listItems4.map((widget) {
      final itemWidget4 = widget as ListEachItemView; // Replace with the appropriate widget type
      return itemWidget4.mBookVO;
    }).toList();
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    await widgetTester.tap(find.byKey(Key('libraryListViewContextualIcon-${itemBooksList4[2]?.bookId}')));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));



    // add to shelves
    // // Check if the BottomSheet is visible
    expect(find.byType(BottomSheetView), findsOneWidget);
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    expect(itemBooksList1[2]?.title, equals(TEST_DATA_THIRD_READ_BOOK_NAME));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    expect(find.text(ADD_TO_SHELVES_TXT), findsOneWidget);
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    await widgetTester.tap(find.text(ADD_TO_SHELVES_TXT));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    //add to shelves list page
    expect(find.byType(AddToShelvesPage), findsOneWidget);
    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    //click check box

    final listItemFinder5 = find.byType(ShelfCheckBoxListItemView); // Replace with the appropriate widget type

    final List<Widget> listItems5 = widgetTester.widgetList(listItemFinder5).toList();
    final List<ShelvesVO?> itemShelvesList5 = listItems5.map((widget) {
      final itemWidget5 = widget as ShelfCheckBoxListItemView; // Replace with the appropriate widget type
      return itemWidget5.shelvesVO;
    }).toList();
    // print('check title ${itemShelvesList[0]?.shelfId}');
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    await widgetTester.tap(find.byKey(Key('chk-${itemShelvesList5[0]?.shelfId}')));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    await widgetTester.tap(find.byKey(Key('closeIcon')));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    expect(find.text('Your books'), findsOneWidget);
    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    await widgetTester.tap(find.text('Your shelves'));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    expect(find.text('3 books'), findsOneWidget);
    await widgetTester.pumpAndSettle(Duration(seconds: 3));


    ///go to create shelf page
    await widgetTester.tap(find.byType(ShelvesListEachItemView));
    await widgetTester.pumpAndSettle(Duration(seconds: 3));
    expect(find.byType(CreateShelfPage), findsOneWidget);
    expect(find.text('10 Interaction Design Books to Read'), findsOneWidget);
    await widgetTester.pumpAndSettle(Duration(seconds: 3));

    ///filter test
    expect(find.text(TEST_DATA_FIRST_CATEGORY_NAME), findsOneWidget);
    expect(find.text(TEST_DATA_SECOND_CATEGORY_NAME), findsOneWidget);
    expect(find.text(TEST_DATA_FIRST_READ_BOOK_NAME), findsOneWidget);
    expect(find.text(TEST_DATA_SECOND_READ_BOOK_NAME), findsOneWidget);
    expect(find.text(TEST_DATA_THIRD_READ_BOOK_NAME), findsOneWidget);

    ///chip first category click
    await widgetTester.tap(find.text(TEST_DATA_FIRST_CATEGORY_NAME));
    await widgetTester.pumpAndSettle(Duration(seconds: 5));
    expect(find.text(TEST_DATA_FIRST_READ_BOOK_NAME), findsOneWidget);
    expect(find.text(TEST_DATA_SECOND_READ_BOOK_NAME), findsOneWidget);

    ///chip second category click
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    await widgetTester.tap(find.text(TEST_DATA_FIRST_CATEGORY_NAME));
    await widgetTester.pumpAndSettle(Duration(seconds: 5));


    await widgetTester.drag(
        find.byKey(Key('chipListView')),
        Offset(-80.0,0.0)
    );
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    await widgetTester.tap(find.text(TEST_DATA_SECOND_CATEGORY_NAME));
    await widgetTester.pumpAndSettle(Duration(seconds: 5));
    expect(find.text(TEST_DATA_THIRD_READ_BOOK_NAME), findsOneWidget);

    await widgetTester.pumpAndSettle(Duration(seconds: 5));
    await widgetTester.tap(find.byKey(Key('chipCategoryClosebtn')));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));


    ///filter sort icon click
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    await widgetTester.tap(find.byKey(Key('filterSortIcon')));
    await widgetTester.pumpAndSettle(Duration(seconds: 5));
    final bottomSheetFinder = find.byKey(Key('filterBottomSheet'));//find.byType(BottomSheet);

    // Check if the BottomSheet is visible
    expect(bottomSheetFinder, findsOneWidget);

    expect(find.text(TEST_DATA_RECENTLY_TXT), findsOneWidget);
    expect(find.text(TEST_DATA_TITLE_TXT), findsOneWidget);
    expect(find.text(TEST_DATA_AUTHOR_TXT), findsOneWidget);
    await widgetTester.tap(find.text('Title'));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    final listItemFinder6 = find.byType(ListEachItemView); // Replace with the appropriate widget type

    final List<Widget> listItems6 = widgetTester.widgetList(listItemFinder6).toList();
    final List<BookVO?> itemBooksList6 = listItems6.map((widget) {
      final itemWidget6 = widget as ListEachItemView; // Replace with the appropriate widget type
      return itemWidget6.mBookVO;
    }).toList();

    print('check title ${itemBooksList6[0]?.title}');

    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    final expectedText = itemBooksList6[0]?.title??"";
    final textWidget = find.text(expectedText);
    final actualText = widgetTester.widget<Text>(textWidget).data;

    expect(actualText, equals(TEST_DATA_SECOND_READ_BOOK_NAME));

    ///filter sort icon click second time
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    await widgetTester.tap(find.byKey(Key('filterSortIcon')));
    await widgetTester.pumpAndSettle(Duration(seconds: 5));
    final bottomSheetFinder1 = find.byKey(Key('filterBottomSheet'));//find.byType(BottomSheet);

    // Check if the BottomSheet is visible
    expect(bottomSheetFinder1, findsOneWidget);

    expect(find.text(TEST_DATA_RECENTLY_TXT), findsOneWidget);
    expect(find.text(TEST_DATA_TITLE_TXT), findsOneWidget);
    expect(find.text(TEST_DATA_AUTHOR_TXT), findsOneWidget);
    await widgetTester.tap(find.text('Author'));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    final listItemFinder7 = find.byType(ListEachItemView); // Replace with the appropriate widget type

    final List<Widget> listItems7 = widgetTester.widgetList(listItemFinder7).toList();
    final List<BookVO?> itemBooksList7 = listItems7.map((widget) {
      final itemWidget7 = widget as ListEachItemView; // Replace with the appropriate widget type
      return itemWidget7.mBookVO;
    }).toList();

    // print('check title ${itemBooksList1[0]?.title}');

    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    final expectedText1 = itemBooksList7[0]?.title??"";
    final textWidget1 = find.text(expectedText1);
    final actualText1 = widgetTester.widget<Text>(textWidget1).data;

    expect(actualText1, equals(TEST_DATA_FIRST_READ_BOOK_NAME));


    ///Filter by View(large grid select)
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    await widgetTester.tap(find.byKey(Key('filterByView')));
    await widgetTester.pumpAndSettle(Duration(seconds: 5));
    final filterViewBottomSheetFinder = find.byKey(Key('filterByViewBottomSheet'));//find.byType(BottomSheet);

    // Check if the BottomSheet is visible
    expect(filterViewBottomSheetFinder, findsOneWidget);
    expect(find.text('Large grid'), findsOneWidget);
    expect(find.text('Small grid'), findsOneWidget);
    expect(find.text('List'), findsOneWidget);
    await widgetTester.tap(find.text('Large grid'));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    expect(find.byType(LargeGridView), findsOneWidget);

    ///Filter by View(small grid select)
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    await widgetTester.tap(find.byKey(Key('filterByView')));
    await widgetTester.pumpAndSettle(Duration(seconds: 5));
    final filterViewBottomSheetFinder1 = find.byKey(Key('filterByViewBottomSheet'));//find.byType(BottomSheet);

    /// Check if the BottomSheet is visible
    expect(filterViewBottomSheetFinder1, findsOneWidget);
    expect(find.text('Large grid'), findsOneWidget);
    expect(find.text('Small grid'), findsOneWidget);
    expect(find.text('List'), findsOneWidget);
    await widgetTester.tap(find.text('Small grid'));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    expect(find.byType(SmallGridView), findsOneWidget);

    await widgetTester.pumpAndSettle(Duration(seconds: 3));


    await widgetTester.tap(find.byKey(Key('contexturalMenu')));

    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    // // Check if the BottomSheet is visible
    expect(find.byType(ShelfActionBottomSheetView), findsOneWidget);
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    expect(find.text('Rename shelf'), findsOneWidget);
    expect(find.text('Delete shelf'), findsOneWidget);
    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    await widgetTester.tap(find.text('Delete shelf'));
    await widgetTester.pumpAndSettle(Duration(seconds: 3));

    expect(find.text('Your shelves'), findsOneWidget);
    final listItemFinder8 = find.byType(ShelvesListEachItemView); // Replace with the appropriate widget type

    final List<Widget> listItems8 = widgetTester.widgetList(listItemFinder8).toList();
    final List<ShelvesVO?> itemShelvesList8 = listItems8.map((widget) {
      final itemWidget8 = widget as ShelvesListEachItemView; // Replace with the appropriate widget type
      return itemWidget8.shelvesVO;
    }).toList();

    expect(0, equals(itemShelvesList8.length));

    await widgetTester.pumpAndSettle(Duration(seconds: 3));


    await widgetTester.tap(find.text('Your books'));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    //click contextual icon
    final listItemFinder9 = find.byType(ListEachItemView); // Replace with the appropriate widget type

    final List<Widget> listItems9 = widgetTester.widgetList(listItemFinder9).toList();
    final List<BookVO?> itemBooksList9 = listItems9.map((widget) {
      final itemWidget9 = widget as ListEachItemView; // Replace with the appropriate widget type
      return itemWidget9.mBookVO;
    }).toList();
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    await widgetTester.tap(find.byKey(Key('libraryListViewContextualIcon-${itemBooksList9[0]?.bookId}')));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    // add to shelves
    // // Check if the BottomSheet is visible
    expect(find.byType(BottomSheetView), findsOneWidget);
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    expect(itemBooksList9[0]?.title, equals(TEST_DATA_FIRST_READ_BOOK_NAME));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    expect(find.text(DELETE_FROMA_YOUR_LIBRARY_TXT), findsOneWidget);
    await widgetTester.pumpAndSettle(Duration(seconds: 5));


    expect(find.text(TEST_DATA_FIRST_READ_BOOK_NAME), isNull);
    //check book list length
    // final listItemFinder10 = find.byType(ListEachItemView); // Replace with the appropriate widget type
    //
    // final List<Widget> listItems10 = widgetTester.widgetList(listItemFinder10).toList();
    // final List<BookVO?> itemBooksList10 = listItems10.map((widget) {
    //   final itemWidget10 = widget as ListEachItemView; // Replace with the appropriate widget type
    //   return itemWidget10.mBookVO;
    // }).toList();
    // await widgetTester.pumpAndSettle(Duration(seconds: 2));
    // expect(2, equals(itemBooksList10.length));

    await widgetTester.pumpAndSettle(Duration(seconds: 2));



  });


}