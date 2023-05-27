import 'package:flutter/foundation.dart';
import 'package:flutter_the_library_app/data/models/library_model.dart';
import 'package:flutter_the_library_app/data/models/library_model_impl.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/data/vos/each_category_book_vo.dart';

class CategoryDetailBloc extends ChangeNotifier{


  ///1
  ///State Variables
  List<EachCategoryBookVO>? mEachCategoryBookVO;

  ///2
  ///Model
  LibraryModel mLibraryModel = LibraryModelImpl();


  CategoryDetailBloc(String categoryName){
   // debugPrint("home bloc");
    ///booklist with category from Network

    mLibraryModel.getEachCategoryBookListDetail(categoryName).then((eachCategoryBookListVO){
      mEachCategoryBookVO = eachCategoryBookListVO;
      notifyListeners();
    }).catchError((error){debugPrint(error.toString());});
  }

  void onTapDeleteBookFromYourLibrary(BookVO bookVO){
    mLibraryModel.deleteBookFromLibrary(bookVO);
    notifyListeners();
  }

}