
import 'package:flutter/foundation.dart';
import 'package:flutter_the_library_app/data/models/library_model.dart';
import 'package:flutter_the_library_app/data/models/library_model_impl.dart';
import 'package:flutter_the_library_app/data/vos/shelves_vo.dart';

class ShelvesBloc extends ChangeNotifier{


  ///1
  ///State Variables
  List<ShelvesVO>? mShelvesList;

  ///2
  ///Model
  LibraryModel mLibraryModel = LibraryModelImpl();

  bool _disposed = false;

  void dispose() {
    _disposed = true;
    // Clean up resources or perform other necessary tasks
    super.dispose();
  }
  ShelvesBloc(){
    debugPrint("Shelves bloc");

     ///shelves list from Database

    mLibraryModel.getShelvesList().listen((shelvesList) {
      mShelvesList = shelvesList;
      if (!_disposed) {
        // Perform operations or computations
        notifyListeners();
      }

    }).onError((error) {
      debugPrint(error.toString());
    });
  }

  void saveShelfVO(ShelvesVO shelvesVO){
    mLibraryModel.createNewShelf(shelvesVO);
    notifyListeners();
  }

  void renameShelfVO(ShelvesVO shelvesVO){
    mLibraryModel.renameShelf(shelvesVO);
    notifyListeners();
  }

  void onTapDeleteShelfVO(ShelvesVO shelvesVO) {
    print("onTap delete shelf");
    mLibraryModel.deleteShelfVO(shelvesVO);
    notifyListeners();
  }

}
