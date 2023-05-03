import 'package:flutter_the_library_app/data/models/library_model.dart';
import 'package:flutter_the_library_app/data/vos/category_book_vo.dart';
import 'package:flutter_the_library_app/data/vos/category_books_list_vo.dart';
import 'package:flutter_the_library_app/network/dataagents/library_data_agent.dart';
import 'package:flutter_the_library_app/network/dataagents/retrofit_data_agent_impl.dart';

class LibraryModelImpl extends LibraryModel{


  LibraryDataAgent _libraryDataAgent = RetrofitDataAgentImpl();

  static final LibraryModelImpl _singleton  = LibraryModelImpl._internal();

  factory LibraryModelImpl(){
    return _singleton;
  }

  LibraryModelImpl._internal();


  @override
  Future<List<CategoryBooksListVO>?> getOverviewBooksList() {
   return _libraryDataAgent.getOverviewBooksList().then((value) async{
     return Future.value(value);
   });
  }

}