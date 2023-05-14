
import 'package:flutter/foundation.dart';
import 'package:flutter_the_library_app/data/models/library_model.dart';
import 'package:flutter_the_library_app/data/models/library_model_impl.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/data/vos/shelves_vo.dart';

class ShelvesBloc extends ChangeNotifier{


  ///1
  ///State Variables
  List<ShelvesVO>? mShelvesList;



  // List<BookVO>? mCategoryTypeList;
  // List<BookVO>? mReadBookList;
  // String selectedItemData = "Recently opened";
  // String selectedViewItemData = "List";
  // String selectedViewIcon = "assets/images/ic_list_gray_64.png";



  ///2
  ///Model
  LibraryModel mLibraryModel = LibraryModelImpl();


  ShelvesBloc(){
    debugPrint("Shelves bloc");

     ///shelves list from Database

    mLibraryModel.getShelvesList().listen((shelvesList) {
      mShelvesList = shelvesList;
      notifyListeners();
    }).onError((error) {
      debugPrint(error.toString());
    });


    //
    // mLibraryModel.getReadBookList(1).listen((booklist) {
    //   mReadBookList = booklist;
    //   notifyListeners();
    // }).onError((error) {
    //   debugPrint(error.toString());
    // });
    //
    // mLibraryModel.getCategoryList().listen((categoryList) {
    //   mCategoryTypeList = categoryList;
    //
    //   notifyListeners();
    // }).onError((error) {
    //   debugPrint(error.toString());
    // });


  }

  void saveShelfVO(ShelvesVO shelvesVO){
    mLibraryModel.createNewShelf(shelvesVO);

  }

  void onTapDeleteShelfVO(ShelvesVO shelvesVO) {
    mLibraryModel.deleteShelfVO(shelvesVO);
  }

  // void onTapShelfDetail(ShelvesVO? shelvesVO){
  //
  //   mReadBookList = shelvesVO?.booksList;
  //   notifyListeners();
  // }
  //
  // void getAllCategoryList() {
  //   print("get all category list");
  //   mLibraryModel.getCategoryList().listen((categoryList) {
  //     mCategoryTypeList = categoryList;
  //
  //     notifyListeners();
  //   }).onError((error) {
  //     debugPrint(error.toString());
  //   });
  // }
  //
  // void onTapSortFilter(String selectedSortFilterItem) {
  //   print("filterId = " + selectedSortFilterItem);
  //
  //   int sortFilterId = 1;
  //   if (selectedSortFilterItem == "Recently opened") {
  //     sortFilterId = 1;
  //   } else if (selectedSortFilterItem == "Title") {
  //     sortFilterId = 2;
  //   } else if (selectedSortFilterItem == "Author") {
  //     sortFilterId = 3;
  //   }
  //
  //   selectedItemData = selectedSortFilterItem;
  //
  //   mLibraryModel.getReadBookList(sortFilterId).listen((booklist) {
  //     mReadBookList = booklist;
  //
  //     notifyListeners();
  //   }).onError((error) {
  //     debugPrint(error.toString());
  //   });
  // }
  //
  // void onTapChangeGridView(String selectedChangeGridView) {
  //   debugPrint("DisplayAndSortingView ${selectedChangeGridView}");
  //   selectedViewItemData = selectedChangeGridView;
  //   if (selectedViewItemData == "List") {
  //     selectedViewIcon = "assets/images/ic_list_gray_64.png";
  //   } else if (selectedViewItemData == "Large grid") {
  //     selectedViewIcon = "assets/images/ic_large_grid_gray_64.png";
  //   } else {
  //     selectedViewIcon = "assets/images/ic_small_grid_gray_64.png";
  //   }
  //
  //   notifyListeners();
  // }
  //
  // void onTapCategoryFilter(List<BookVO>? paramBookVO) {
  //   print("onTapCategoryFilter = ${paramBookVO?.length}");
  //
  //   // mLibraryModel.getCategoryList().listen((categoryList) {
  //   //  List<BookVO> categoryArrayList = categoryList;
  //   //  categoryArrayList.forEach((element) {
  //   //
  //   //     BookVO bookVO = element;
  //   //     if(paramBookVO?.categoryId == element.categoryId)
  //   //     {
  //   //       print("onTapCategoryFilter equal id case");
  //   //       bookVO.selected = true;
  //   //       mCategoryTypeList?.add(bookVO);
  //   //     }else{
  //   //       bookVO.selected = false;
  //   //       mCategoryTypeList?.add(bookVO);
  //   //     }
  //   //
  //   //   });
  //   //  notifyListeners();
  //   // }).onError((error){
  //   //   debugPrint(error.toString());
  //   // });
  //
  //   mLibraryModel
  //       .getReadBookListByCategory(paramBookVO ?? [])
  //       .listen((booklist) {
  //     //mCategoryTypeList = [];
  //     // mReadBookList = booklist;
  //
  //     // mReadBookList = booklist;
  //
  //     // for (int i = 0; i < booklist.length; i++) {
  //     //
  //     //   if(booklist[i].categoryId == paramBookVO?.categoryId)
  //     //     {
  //     //       booklist[i].selected = true;
  //     //       mReadBookList?[i] = booklist[i];
  //     //     }else{
  //     //     booklist[i].selected = false;
  //     //     mReadBookList?[i] = booklist[i];
  //     //   }
  //     //
  //     // }
  //
  //     mReadBookList = booklist;
  //
  //     // print("onTapCategoryFilter array = ${mCategoryTypeList.toString()}");
  //
  //     notifyListeners();
  //   }).onError((error) {
  //     debugPrint(error.toString());
  //   });
  // }
}
