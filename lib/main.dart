import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/blocs/library_bloc.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/data/vos/shelves_vo.dart';
import 'package:flutter_the_library_app/pages/app_main_page.dart';
import 'package:flutter_the_library_app/persistence/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
void main() async {

  await Hive.initFlutter();

  Hive.registerAdapter(BookVOAdapter());
  Hive.registerAdapter(ShelvesVOAdapter());

  await Hive.openBox<BookVO>(BOX_NAME_BOOK_VO);
  await Hive.openBox<ShelvesVO>(BOX_NAME_SHELVES_VO);



  // check if the box is open
  bool isOpen = Hive.isBoxOpen(BOX_NAME_BOOK_VO);

  print('Box is open: $isOpen');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AppMainPage(),
    );
  }
}


