
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
  String? checkedDataId;

  ///2
  ///Model
  LibraryModel mLibraryModel = LibraryModelImpl();

  bool _disposed = false;

  void dispose() {
    _disposed = true;
    // Clean up resources or perform other necessary tasks
    super.dispose();
  }
  AddToShelvesBloc(){//ShelvesVO shelvesVO
    debugPrint("add to Shelves bloc");

    ///shelves list from Database


    mLibraryModel.getShelvesList().listen((shelvesList) {
      mShelvesList = shelvesList;
      mShelvesList?.forEach((element) {
        element.isSelected = false;
      });
      if (!_disposed) {
        // Perform operations or computations
        notifyListeners();
      }
     // notifyListeners();
    }).onError((error) {
      debugPrint(error.toString());
    });

  }

  void saveShelfVO(ShelvesVO shelvesVO){
    mLibraryModel.createNewShelf(shelvesVO);
    notifyListeners();
  }

  void onTapDeleteShelfVO(ShelvesVO shelvesVO) {
    mLibraryModel.deleteShelfVO(shelvesVO);
    notifyListeners();
  }

  void onTapCheckBox(String shelvesId,BookVO? bookVO,bool checkStatus){
    isChecked = checkStatus;
   // bookVO?.selected = isChecked;
    checkedDataId = shelvesId;

    mLibraryModel.addBookVODataToShelf(shelvesId, bookVO);
    // mLibraryModel.getShelvesList().listen((shelvesList) {
    //   mShelvesList = shelvesList;
    //   notifyListeners();
    // }).onError((error) {
    //   debugPrint(error.toString());
    // });
  }

}