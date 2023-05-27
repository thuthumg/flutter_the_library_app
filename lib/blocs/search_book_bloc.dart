import 'package:flutter/foundation.dart';
import 'package:flutter_the_library_app/data/models/library_model.dart';
import 'package:flutter_the_library_app/data/models/library_model_impl.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/data/vos/google_book_vo.dart';

class SearchBookBloc extends ChangeNotifier{


  ///1
  ///State Variables
  List<BookVO>? mBooksList;

  ///2
  ///Model
  LibraryModel mLibraryModel = LibraryModelImpl();


  SearchBookBloc(String searchQuery){
    // debugPrint("home bloc");
    ///booklist with category from Network

    mLibraryModel.getGoogleBooksList(searchQuery).then((searchBooksList){
      List<GoogleBookVO> searchBookList = searchBooksList??[];
      List<BookVO> bookList = [];


      for (var index = 0; index < searchBookList.length; index++) {
        bookList.add(searchBookList[index].convertBookVO(searchBookList[index].id??"",index));
      }
      mBooksList = bookList;

      notifyListeners();
    }).catchError((error){debugPrint(error.toString());});

  }

  void onSearchQuery(String query){
    mLibraryModel.getGoogleBooksList(query).then((searchBooksList){


      List<GoogleBookVO> searchBookList = searchBooksList??[];
      List<BookVO> bookList = [];


      for (var index = 0; index < searchBookList.length; index++) {
        bookList.add(searchBookList[index].convertBookVO(searchBookList[index].id??"",index));
      }

      mBooksList = bookList;

      notifyListeners();
    }).catchError((error){debugPrint(error.toString());});
  }


}