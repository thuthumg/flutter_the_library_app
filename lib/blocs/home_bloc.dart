import 'package:flutter/foundation.dart';
import 'package:flutter_the_library_app/data/models/library_model.dart';
import 'package:flutter_the_library_app/data/models/library_model_impl.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/data/vos/category_books_list_vo.dart';

class HomeBloc extends ChangeNotifier{


  ///1
  ///State Variables
  List<CategoryBooksListVO>? mCategoryBooksListVOList;
  List<BookVO>? mReadBookList;
  ///2
///Model
  LibraryModel mLibraryModel = LibraryModelImpl();


  HomeBloc(){
  debugPrint("home bloc");
    ///booklist with category from Network
    mLibraryModel.getOverviewBooksList().then((categoryBooksListVO){
      mCategoryBooksListVOList = categoryBooksListVO;
      notifyListeners();
    }).catchError((error){debugPrint(error.toString());});

    ///bookslist from Database
    mLibraryModel.getReadBookList(1).listen((booklist) {
      mReadBookList = booklist;
      notifyListeners();
    }).onError((error) {
      debugPrint(error.toString());
    });
  }

  void onTapItem(){

  }

}