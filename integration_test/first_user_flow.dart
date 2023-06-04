import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_the_library_app/components/display_and_sorting_view.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/data/vos/shelves_vo.dart';
import 'package:flutter_the_library_app/main.dart';
import 'package:flutter_the_library_app/pages/home_page.dart';
import 'package:flutter_the_library_app/persistence/hive_constants.dart';
import 'package:flutter_the_library_app/widgets/radio_group_view.dart';

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


  testWidgets("Tap Book , Navigate To Book Detail , Navigate to library page , filter and sort the book list", (widgetTester) async{

    await widgetTester.pumpWidget(MyApp());
    await Future.delayed(Duration(seconds: 2));

    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    expect(find.byType(HomePage), findsOneWidget);

    await widgetTester.pumpAndSettle(Duration(seconds: 5));


    // final carouselViewFinder = find.byKey(Key('readBookCarouselSlider')); // Replace with your Carousel View type
    // final carouselView = widgetTester.widget<CarouselSlider>(carouselViewFinder); // Replace with your Carousel View type
    // final objectData = carouselView.items;
    // expect(objectData, isNotNull);
    // expect(objectData?.length, equals(0));


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

    final listItemFinder = find.byType(ListEachItemView); // Replace with the appropriate widget type

    final List<Widget> listItems = widgetTester.widgetList(listItemFinder).toList();
    final List<BookVO?> itemBooksList = listItems.map((widget) {
      final itemWidget = widget as ListEachItemView; // Replace with the appropriate widget type
      return itemWidget.mBookVO;
    }).toList();

    print('check title ${itemBooksList[0]?.title}');

    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    final expectedText = itemBooksList[0]?.title??"";
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

    final listItemFinder1 = find.byType(ListEachItemView); // Replace with the appropriate widget type

    final List<Widget> listItems1 = widgetTester.widgetList(listItemFinder1).toList();
    final List<BookVO?> itemBooksList1 = listItems1.map((widget) {
      final itemWidget1 = widget as ListEachItemView; // Replace with the appropriate widget type
      return itemWidget1.mBookVO;
    }).toList();

   // print('check title ${itemBooksList1[0]?.title}');

    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    final expectedText1 = itemBooksList1[0]?.title??"";
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



    // final radioTileFinder = find.byType(RadioListTile); // Replace with the appropriate widget type
    //
    // final RadioListTile radioTile = widgetTester.widget(radioTileFinder);
    // final selectedValue = radioTile.value;
    //
    // print(selectedValue);

   // final radioTileFinder = find.byType(RadioListTile); // Replace with the appropriate widget type
   // await widgetTester.tap(radioTileFinder);
   // await widgetTester.pumpAndSettle();

    // await widgetTester.tap(find.byType(RadioGroupView));
    // await widgetTester.pumpAndSettle(Duration(seconds: 4));
    //
    // final radioItemFinder = find.byType(RadioListTile); // Replace with the appropriate widget type
    //
    // final List<Widget> radioItems = widgetTester.widgetList(radioItemFinder).toList();
    // final List<String> itemTitle = radioItems.map((widget) {
    //   final itemWidget = widget as RadioListTile; // Replace with the appropriate widget type
    //   return itemWidget.title.toString();
    // }).toList();
    // debugPrint("radio title ${itemTitle.length} //");
    // expect(find.text(itemTitle[1]), equals('Title'));
    // await widgetTester.tap(find.text(itemTitle[1]));

    // final radioTileFinder = find.byType(RadioListTile); // Replace with the appropriate widget type
    //
    // final RadioListTile radioTile = widgetTester.widget(radioTileFinder);
    // final selectedValue = radioTile.value;
    //
    // print(selectedValue); // Output the selected value


    // await widgetTester.pumpAndSettle(Duration(seconds: 2));
    // await widgetTester.tap(find.byKey(Key('filterSortIcon')));
    // await widgetTester.pumpAndSettle(Duration(seconds: 5));
    // final bottomSheetFinder1 = find.byKey(Key('filterBottomSheet'));//find.byType(BottomSheet);
    //
    // // Check if the BottomSheet is visible
    // expect(bottomSheetFinder1, findsOneWidget);
    //
    // expect(find.text(TEST_DATA_RECENTLY_TXT), findsOneWidget);
    // expect(find.text(TEST_DATA_TITLE_TXT), findsOneWidget);
    // expect(find.text(TEST_DATA_AUTHOR_TXT), findsOneWidget);
    // await widgetTester.tap(bottomSheetFinder1);
    //
    //
    // await widgetTester.pumpAndSettle(Duration(seconds: 2));
    // await widgetTester.tap(find.byKey(Key('filterSortIcon')));
    // await widgetTester.pumpAndSettle(Duration(seconds: 5));
    // final bottomSheetFinder3 = find.byKey(Key('filterBottomSheet'));//find.byType(BottomSheet);
    //
    // // Check if the BottomSheet is visible
    // expect(bottomSheetFinder3, findsOneWidget);

    // expect(find.text(TEST_DATA_RECENTLY_TXT), findsOneWidget);
    // expect(find.text(TEST_DATA_TITLE_TXT), findsOneWidget);
    // expect(find.text(TEST_DATA_AUTHOR_TXT), findsOneWidget);
    // await widgetTester.tap(bottomSheetFinder3);


   // int count = widgetTester
   //      .widgetList<ListView>(find.byKey(ValueKey("bookListViewByListStyle")))
   //      .length;




    //  expect(find.text(TEST_DATA_THIRD_READ_BOOK_NAME), findsOneWidget);
  //  await widgetTester.pumpWidget(bookListExtend);
   // final listView = find.byKey(Key('bookListViewByListStyle'));

/*    final listViewBuilderFinder = find.byType(ListView.builder as Type);

    // Get the ListView.builder widget from the finder
    final listViewBuilder = widgetTester.firstWidget(listViewBuilderFinder) as ListView.builder;

    // Get the number of items in the list
    final itemCount = listViewBuilder.itemCount;

    // Extract the data from the ListView.builder
    final List<MyData> dataSource = List.generate(itemCount, (index) {
      final itemWidget = listViewBuilder.itemBuilder(context, index)(context, index);
      final listItem = itemWidget as ListTile; // Assuming the itemBuilder returns ListTile
      final myData = MyData(title: listItem.title.toString());
      return myData;
    });*/




  // await widgetTester.pumpWidget();
   // await widgetTester.tap(find.byKey(Key('radioListTile-2')));
    //final radioFinder = find.byType(RadioListTile);
    // Tap the first radio list tile to select the first item
   // await widgetTester.tap(radioFinder.at(1));
   // await widgetTester.pump();
   // await widgetTester.pumpAndSettle(Duration(seconds: 3));


    // Pump the custom widget into the tester
   /*.......... await tester.pumpWidget(RadioGroupView(
      autoSelectedData:autoSelectedData,
      filterTypeList: filterTypeList,
      onTapFilterItem: (selectedItem,context){
        debugPrint("FilterBottomSheetView ${selectedItem}");
        this.onTapFilterItem(selectedItem,context);
      },));

    // Find the RadioListTile widget within the custom UI
    final radioListTileFinder = find.byWidgetPredicate((widget) {
      return widget is RadioListTile && widget.title.text == 'Your RadioListTile Title';
    });

    // Simulate the tap on the RadioListTile
    await tester.tap(radioListTileFinder);*/

    // Verify that the desired action or state change occurred
    // ...




   // final radioListTiles = find.byType(RadioListTile);
    /*final Type radioListTileType = const RadioListTile<int>(
      value: 0,
      groupValue: 0,
      onChanged: null,
    ).runtimeType;*/
    // Iterate over the RadioListTile widgets
  //   List<RadioListTile<int>> generatedRadioListTiles;
  //   List<RadioListTile<int>> findTiles() => find
  //       .byType(RadioListTile)
  //       .evaluate()
  //       .map<Widget>((Element element) => element.widget)
  //       .cast<RadioListTile<int>>()
  //       .toList();
  });


  //  debugPrint("check radio value = ${widgetTester.widget<RadioListTile>(radioFinder).value}");
  // Check if the first item is selected
  //  expect(widgetTester.widget<RadioListTile>(radioFinder).value, equals(TEST_DATA_AUTHOR_TXT));

  // Tap the second radio list tile to select the second item
  /* await widgetTester.tap(radioFinder.at(1));
    await widgetTester.pump();

    // Check if the second item is selected
    expect(widgetTester.widget<RadioListTile>(radioFinder).value, equals(TEST_DATA_TITLE_TXT));*/

  /*   final radioFinder = find.byKey(Key('radioListTile'));
    // Check if the checkbox is initially not selected
    expect(widgetTester.widget<RadioListTile>(radioFinder).value, false);
    // Tap the checkbox to select it
    await widgetTester.tap(radioFinder);
    await widgetTester.pump();
    // Check if the checkbox is selected after tapping it
    expect(widgetTester.widget<RadioListTile>(radioFinder).value, true);*/
  /*testWidgets("Tap library page and sort function", (widgetTester) async{

    await widgetTester.pumpWidget(MyApp());
    await Future.delayed(Duration(seconds: 2));

    await widgetTester.pumpAndSettle(Duration(seconds: 2));

    expect(find.byType(AppMainPage), findsOneWidget);

    await widgetTester.pumpAndSettle(Duration(seconds: 5));

    await widgetTester.tap(find.text('Library'));

    await widgetTester.pumpAndSettle(Duration(seconds: 10));
    expect(find.text(TEST_DATA_FIRST_CATEGORY_NAME), findsOneWidget);
    expect(find.text(TEST_DATA_SECOND_CATEGORY_NAME), findsOneWidget);
    expect(find.text(TEST_DATA_FIRST_READ_BOOK_NAME), findsOneWidget);
    expect(find.text(TEST_DATA_SECOND_READ_BOOK_NAME), findsOneWidget);
    expect(find.text(TEST_DATA_THIRD_READ_BOOK_NAME), findsOneWidget);

    //tester.pumpWidget(find)
    await widgetTester.tap(find.text(TEST_DATA_FIRST_CATEGORY_NAME));
    await widgetTester.pumpAndSettle(Duration(seconds: 5));
    expect(find.text(TEST_DATA_FIRST_READ_BOOK_NAME), findsOneWidget);
    expect(find.text(TEST_DATA_THIRD_READ_BOOK_NAME), findsOneWidget);


    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    await widgetTester.tap(find.text(TEST_DATA_FIRST_CATEGORY_NAME));
    await widgetTester.pumpAndSettle(Duration(seconds: 5));

    await widgetTester.tap(find.byKey(Key('filterSortIcon')));

    // await widgetTester.tap(find.text(TEST_DATA_SECOND_CATEGORY_NAME));
    // await widgetTester.pumpAndSettle(Duration(seconds: 5));
    // expect(find.text(TEST_DATA_SECOND_READ_BOOK_NAME), findsOneWidget);


   *//* await widgetTester.pumpAndSettle(Duration(seconds: 5));
    await widgetTester.tap(find.byKey(Key('chipCategoryClosebtn')));
    await widgetTester.pumpAndSettle(Duration(seconds: 2));
    expect(find.text(TEST_DATA_FIRST_READ_BOOK_NAME), findsOneWidget);
    expect(find.text(TEST_DATA_SECOND_READ_BOOK_NAME), findsOneWidget);
    expect(find.text(TEST_DATA_THIRD_READ_BOOK_NAME), findsOneWidget);*//*


  });*/
}