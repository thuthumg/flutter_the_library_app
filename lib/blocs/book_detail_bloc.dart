import 'package:flutter/foundation.dart';
import 'package:flutter_the_library_app/data/models/library_model.dart';
import 'package:flutter_the_library_app/data/models/library_model_impl.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';

class BookDetailsBloc extends ChangeNotifier{
  ///State
  BookVO? bookVO;

  ///Model
 LibraryModel mLibraryModel = LibraryModelImpl();

 BookDetailsBloc(BookVO? bookVO){
    debugPrint("detail page bloc");
   ///Book Detail
   if(bookVO != null)
     {
       mLibraryModel.getBookDetails(bookVO).then((value) {

         if(value != null)
         {
           this.bookVO = value;
         }
         notifyListeners();
       }).catchError((error){debugPrint(error.toString());});
     }
 }
}