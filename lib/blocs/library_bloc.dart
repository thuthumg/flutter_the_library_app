import 'package:flutter/foundation.dart';
import 'package:flutter_the_library_app/data/models/library_model.dart';
import 'package:flutter_the_library_app/data/models/library_model_impl.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';

class LibraryBloc extends ChangeNotifier{


///1
///State Variables
List<BookVO>? mCategoryTypeList;
List<BookVO>? mReadBookList;
///2
///Model
LibraryModel mLibraryModel = LibraryModelImpl();


LibraryBloc(){
  debugPrint("Library bloc");

  ///bookslist from Database
  mLibraryModel.getReadBookList(1).listen((booklist) {
    mReadBookList = booklist;
    notifyListeners();
  }).onError((error) {
    debugPrint(error.toString());
  });

  mLibraryModel.getCategoryList().listen((categoryList) {
    mCategoryTypeList = categoryList;

    notifyListeners();

  }).onError((error){
    debugPrint(error.toString());
  });
}
void getAllCategoryList(){
  print("get all category list");
  mLibraryModel.getCategoryList().listen((categoryList) {
    mCategoryTypeList = categoryList;

    notifyListeners();

  }).onError((error){
    debugPrint(error.toString());
  });
}
void onTapSortFilter(int filterId){
  _getReadBooksByFilterIdAndRefresh(filterId);
}

void _getReadBooksByFilterIdAndRefresh(int filterId){

  print("filterId = "+filterId.toString());

  mLibraryModel.getReadBookList(filterId).listen((booklist) {
    mReadBookList = booklist;

    notifyListeners();
  }).onError((error) {
    debugPrint(error.toString());
  });
}


void onTapCategoryFilter(List<BookVO>? paramBookVO){
  print("onTapCategoryFilter = ${paramBookVO?.length}");

  // mLibraryModel.getCategoryList().listen((categoryList) {
  //  List<BookVO> categoryArrayList = categoryList;
  //  categoryArrayList.forEach((element) {
  //
  //     BookVO bookVO = element;
  //     if(paramBookVO?.categoryId == element.categoryId)
  //     {
  //       print("onTapCategoryFilter equal id case");
  //       bookVO.selected = true;
  //       mCategoryTypeList?.add(bookVO);
  //     }else{
  //       bookVO.selected = false;
  //       mCategoryTypeList?.add(bookVO);
  //     }
  //
  //   });
  //  notifyListeners();
  // }).onError((error){
  //   debugPrint(error.toString());
  // });

  mLibraryModel.getReadBookListByCategory(paramBookVO??[]).listen((booklist) {
    //mCategoryTypeList = [];
   // mReadBookList = booklist;



   // mReadBookList = booklist;

    // for (int i = 0; i < booklist.length; i++) {
    //
    //   if(booklist[i].categoryId == paramBookVO?.categoryId)
    //     {
    //       booklist[i].selected = true;
    //       mReadBookList?[i] = booklist[i];
    //     }else{
    //     booklist[i].selected = false;
    //     mReadBookList?[i] = booklist[i];
    //   }
    //
    // }

    mReadBookList = booklist;

   // print("onTapCategoryFilter array = ${mCategoryTypeList.toString()}");

    notifyListeners();
  }).onError((error) {
    debugPrint(error.toString());
  });
}



}