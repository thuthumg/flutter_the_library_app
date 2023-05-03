import 'package:flutter/foundation.dart';
import 'package:flutter_the_library_app/data/models/library_model.dart';
import 'package:flutter_the_library_app/data/models/library_model_impl.dart';
import 'package:flutter_the_library_app/data/vos/category_books_list_vo.dart';

class HomeBloc extends ChangeNotifier{


  ///1
  ///State Variables
  List<CategoryBooksListVO>? mCategoryBooksListVOList;

  ///2
///Model
  LibraryModel mLibraryModel = LibraryModelImpl();


  HomeBloc(){
    mLibraryModel.getOverviewBooksList().then((categoryBooksListVO){
      mCategoryBooksListVOList = categoryBooksListVO;
      notifyListeners();
    }).catchError((error){debugPrint(error.toString());});
  }


}