
import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/blocs/library_bloc.dart';
import 'package:flutter_the_library_app/widgets/your_books_your_shelves_tab_bar_view.dart';
import 'package:provider/provider.dart';

class LibraryPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return
     ChangeNotifierProvider(
       create: (context) => LibraryBloc(),
       child: Container(
        //  width: MediaQuery.of(context).size.width,
        //  height: MediaQuery.of(context).size.height,
         color: Color.fromRGBO(223, 235, 249, 1),
         child: YourBooksYourShelvesTabBarView(),
         // color: BACKGROUND_COLOR,
       ),
     );

  }

}