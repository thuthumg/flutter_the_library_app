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
  Stream<List<BookVO>> getReadBookList(int sortingFlag) {
    return mBookDao
        .getAllBooksEventStream()
        .startWith(mBookDao.getBookVOListStream(sortingFlag))
        .map((event)=> mBookDao.getAllBooks(sortingFlag));
  }

  @override
  Stream<List<BookVO>> getCategoryList() {
    return mBookDao
        .getAllBooksEventStream()
        .startWith(mBookDao.getCategoryListStream())
        .map((event) => mBookDao.getCategoryList());
  }

  @override
  Stream<List<BookVO>> getReadBookListByCategory(List<BookVO>? selectedCategoryBookList) {

    print("Stream selected data =${selectedCategoryBookList?.length}");

    if(selectedCategoryBookList?.length == 0)
      {
        return mBookDao
            .getAllBooksEventStream()
            .startWith(mBookDao.getBookVOListStream(1))
            .map((event)=> mBookDao.getAllBooks(1));
      }else{

      return mBookDao
          .getAllBooksEventStream()
          .startWith(mBookDao.getBookVOListByCategoryStream(selectedCategoryBookList))
          .map((event)=> mBookDao.getAllBooksByCategory(selectedCategoryBookList));
    }

  }


}