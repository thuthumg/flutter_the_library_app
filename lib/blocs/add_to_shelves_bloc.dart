
import 'package:flutter/foundation.dart';
import 'package:flutter_the_library_app/data/models/library_model.dart';
import 'package:flutter_the_library_app/data/models/library_model_impl.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/data/vos/shelves_vo.dart';

class AddToShelvesBloc  extends ChangeNotifier{


  ///1
  ///State Variables
  List<ShelvesVO>? mShelvesList;
  bool isChecked = false;

  ///2
  ///Model
  LibraryModel mLibraryModel = LibraryModelImpl();


  AddToShelvesBloc(){//ShelvesVO shelvesVO
    debugPrint("add to Shelves bloc");

    ///shelves list from Database


    mLibraryModel.getShelvesList().listen((shelvesList) {
      mShelvesList = shelvesList;
      notifyListeners();
    }).onError((error) {
      debugPrint(error.toString());
    });

  }

  void saveShelfVO(ShelvesVO shelvesVO){
    mLibraryModel.createNewShelf(shelvesVO);

  }

  void onTapDeleteShelfVO(ShelvesVO shelvesVO) {
    mLibraryModel.deleteShelfVO(shelvesVO);
  }

  void onTapCheckBox(String shelvesId,BookVO? bookVO){
    isChecked = !isChecked;
    mLibraryModel.addBookVODataToShelf(shelvesId, bookVO);
  }

}