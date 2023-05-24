import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/blocs/search_book_bloc.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/resources/colors.dart';
import 'package:flutter_the_library_app/widgets/google_search_ebook_and_audio_book_list_view.dart';
import 'package:flutter_the_library_app/widgets/search_box_view.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget{
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  String _searchText = '';

  void _onSearch(String text) {
    setState(() {
      _searchText = text;
    });
  }

  @override
  Widget build(BuildContext context) {

    debugPrint("search page changes text ${_searchText}");

   return ChangeNotifierProvider(
     create: (context) => SearchBookBloc(_searchText),
     child: Selector<SearchBookBloc, List<BookVO>?>(
       selector: (context, bloc) => bloc.mBooksList,
       builder: (context, booksList, child) => Scaffold(
         backgroundColor: PRIMARY_COLOR,
         appBar: AppBar(
           backgroundColor: PRIMARY_COLOR,
           automaticallyImplyLeading: false,
           leading: GestureDetector(
               onTap: () {
                 Navigator.pop(context);
               },
               child: const Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black54,)),
           title: SearchBoxView(onSearch: (String paramString){
             setState(() {
              // _onSearch(paramString);
               _searchText = paramString;
               var bloc = Provider.of<SearchBookBloc>(context,listen: false);
               bloc.onSearchQuery(_searchText);


             });
           }),

         ),
         body: Container(
           color: PRIMARY_COLOR,
           child: _searchText.isNotEmpty?
           GoogleSearchEbookAndAudioBookListView(
             mBookList: booksList,
            // searchQuery: _searchText,
           )
               :Container()
         ),
       ),
     ),
   );
  }
}

