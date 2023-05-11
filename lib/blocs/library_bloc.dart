import 'package:flutter/foundation.dart';
import 'package:flutter_the_library_app/data/models/library_model.dart';
import 'package:flutter_the_library_app/data/models/library_model_impl.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';

class LibraryBloc extends ChangeNotifier{


///1
///State Variables
List<String>? mCategoryTypeList;
List<BookVO>? mReadBookList;
///2
///Model
LibraryModel mLibraryModel = LibraryModelImpl();


LibraryBloc(){
  debugPrint("Library bloc");


  ///bookslist from Database
  mLibraryModel.getReadBookList().listen((booklist) {
    mReadBookList = booklist;

    notifyListeners();
  }).onError((error) {
    debugPrint(error.toString());
  });
}


}