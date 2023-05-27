
import 'package:flutter/foundation.dart';
import 'package:flutter_the_library_app/data/models/library_model.dart';
import 'package:flutter_the_library_app/data/models/library_model_impl.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/data/vos/shelves_vo.dart';

class ShelvesCreateBloc extends ChangeNotifier{


  ///1
  ///State Variables
  List<BookVO>? mCategoryTypeList;
  List<BookVO>? mReadBookList;
  String selectedItemData = "Recently opened";
  String selectedViewItemData = "List";
  String selectedViewIcon = "assets/images/ic_list_gray_64.png";

  bool isRenameShelf = false;

  String renameShelfName = "";
  ///2
  ///Model
  LibraryModel mLibraryModel = LibraryModelImpl();


  ShelvesCreateBloc(String shelfId){//ShelvesVO shelvesVO
    debugPrint("Shelves bloc");

    ///shelves list from Database

    if(shelfId != "")
      {
        mLibraryModel.getBookListFromShelves(shelfId).listen((booklist) {
          mReadBookList = booklist;
          notifyListeners();
        }).onError((error) {
          debugPrint(error.toString());
        });

        mLibraryModel.getCategoryListFromShelves(shelfId).listen((categoryList) {
          mCategoryTypeList = categoryList;

          notifyListeners();
        }).onError((error) {
          debugPrint(error.toString());
        });
      }




  }

  void setRenameFlagAndName(bool renameFlag,String oldShelfName){
    isRenameShelf = renameFlag;
    renameShelfName = oldShelfName;
    notifyListeners();
  }

  void saveShelfVO(ShelvesVO shelvesVO){
    mLibraryModel.createNewShelf(shelvesVO);
    notifyListeners();

  }

  // void onTapDeleteShelfVO(ShelvesVO shelvesVO) {
  //   mLibraryModel.deleteShelfVO(shelvesVO);
  //   notifyListeners();
  // }

  void onTapShelfDetail(ShelvesVO? shelvesVO){

    mReadBookList = shelvesVO?.booksList;
    notifyListeners();

  }

  void getAllCategoryList() {
    print("get all category list");
    mLibraryModel.getCategoryList().listen((categoryList) {
      mCategoryTypeList = categoryList;

      notifyListeners();
    }).onError((error) {
      debugPrint(error.toString());
    });
  }

  void onTapSortFilter(String selectedSortFilterItem) {
    print("filterId = " + selectedSortFilterItem);

    int sortFilterId = 1;
    if (selectedSortFilterItem == "Recently opened") {
      sortFilterId = 1;
    } else if (selectedSortFilterItem == "Title") {
      sortFilterId = 2;
    } else if (selectedSortFilterItem == "Author") {
      sortFilterId = 3;
    }

    selectedItemData = selectedSortFilterItem;

    mLibraryModel.getReadBookList(sortFilterId).listen((booklist) {
      mReadBookList = booklist;

      notifyListeners();
    }).onError((error) {
      debugPrint(error.toString());
    });
  }

  void onTapChangeGridView(String selectedChangeGridView) {
    debugPrint("DisplayAndSortingView ${selectedChangeGridView}");
    selectedViewItemData = selectedChangeGridView;
    if (selectedViewItemData == "List") {
      selectedViewIcon = "assets/images/ic_list_gray_64.png";
    } else if (selectedViewItemData == "Large grid") {
      selectedViewIcon = "assets/images/ic_large_grid_gray_64.png";
    } else {
      selectedViewIcon = "assets/images/ic_small_grid_gray_64.png";
    }

    notifyListeners();
  }

  void onTapCategoryFilter(List<BookVO>? paramBookVO) {
    print("onTapCategoryFilter = ${paramBookVO?.length}");

    mLibraryModel
        .getReadBookListByCategory(paramBookVO ?? [])
        .listen((booklist) {

      mReadBookList = booklist;

      // print("onTapCategoryFilter array = ${mCategoryTypeList.toString()}");

      notifyListeners();
    }).onError((error) {
      debugPrint(error.toString());
    });
  }

  void onTapDeleteBookFromYourLibrary(BookVO bookVO){
    mLibraryModel.deleteBookFromLibrary(bookVO);
    notifyListeners();
  }
}
