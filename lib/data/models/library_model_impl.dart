import 'package:flutter_the_library_app/data/models/library_model.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/data/vos/category_books_list_vo.dart';
import 'package:flutter_the_library_app/network/dataagents/library_data_agent.dart';
import 'package:flutter_the_library_app/network/dataagents/retrofit_data_agent_impl.dart';
import 'package:flutter_the_library_app/persistence/daos/book_dao.dart';
import 'package:stream_transform/stream_transform.dart';

class LibraryModelImpl extends LibraryModel{


  LibraryDataAgent _libraryDataAgent = RetrofitDataAgentImpl();

  static final LibraryModelImpl _singleton  = LibraryModelImpl._internal();

  factory LibraryModelImpl(){
    return _singleton;
  }

  LibraryModelImpl._internal();


  ///Daos
  BookDao mBookDao = BookDao();


  @override
  Future<List<CategoryBooksListVO>?> getOverviewBooksList() {
   return _libraryDataAgent.getOverviewBooksList().then((value) async{
     return Future.value(value);
   });
  }

  @override
  Future<BookVO?> getBookDetails(BookVO bookVO) {
    mBookDao.saveBookVO(bookVO);
    return Future.value(bookVO);
  }

  @override
  Stream<List<BookVO>> getReadBookList() {
    return mBookDao
        .getAllBooksEventStream()
        .startWith(mBookDao.getBookVOListStream())
        .map((event)=> mBookDao.getAllBooks());
  }


}