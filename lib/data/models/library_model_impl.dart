import 'package:flutter_the_library_app/data/models/library_model.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/data/vos/category_books_list_vo.dart';
import 'package:flutter_the_library_app/data/vos/shelves_vo.dart';
import 'package:flutter_the_library_app/network/dataagents/library_data_agent.dart';
import 'package:flutter_the_library_app/network/dataagents/retrofit_data_agent_impl.dart';
import 'package:flutter_the_library_app/persistence/daos/book_dao.dart';
import 'package:flutter_the_library_app/persistence/daos/shelf_dao.dart';
import 'package:stream_transform/stream_transform.dart';

class LibraryModelImpl extends LibraryModel {
  LibraryDataAgent _libraryDataAgent = RetrofitDataAgentImpl();

  static final LibraryModelImpl _singleton = LibraryModelImpl._internal();

  factory LibraryModelImpl() {
    return _singleton;
  }

  LibraryModelImpl._internal();

  ///Daos
  BookDao mBookDao = BookDao();
  ShelfDao mShelfDao = ShelfDao();

  ///Home page section
  @override
  Future<List<CategoryBooksListVO>?> getOverviewBooksList() {
    return _libraryDataAgent.getOverviewBooksList().then((value) async {
      return Future.value(value);
    });
  }

  ///Book Detail section
  @override
  Future<BookVO?> getBookDetails(BookVO bookVO) {
    mBookDao.saveBookVO(bookVO);
    return Future.value(bookVO);
  }

  /// Home page carousel view and library page view section
  @override
  Stream<List<BookVO>> getReadBookList(int sortingFlag) {
    return mBookDao
        .getAllBooksEventStream()
        .startWith(mBookDao.getBookVOListStream(sortingFlag))
        .map((event) => mBookDao.getAllBooks(sortingFlag));
  }

  ///library page view section
  @override
  Stream<List<BookVO>> getCategoryList() {
    return mBookDao
        .getAllBooksEventStream()
        .startWith(mBookDao.getCategoryListStream())
        .map((event) => mBookDao.getCategoryList());
  }

  @override
  Stream<List<BookVO>> getReadBookListByCategory(
      List<BookVO>? selectedCategoryBookList) {
    print("Stream selected data =${selectedCategoryBookList?.length}");

    if (selectedCategoryBookList?.length == 0) {
      return mBookDao
          .getAllBooksEventStream()
          .startWith(mBookDao.getBookVOListStream(1))
          .map((event) => mBookDao.getAllBooks(1));
    } else {
      return mBookDao
          .getAllBooksEventStream()
          .startWith(
              mBookDao.getBookVOListByCategoryStream(selectedCategoryBookList))
          .map((event) =>
              mBookDao.getAllBooksByCategory(selectedCategoryBookList));
    }
  }

  ///shelves page view section
  @override
  void createNewShelf(ShelvesVO shelvesVO) {
    mShelfDao.saveShelfVO(shelvesVO);
  }

  @override
  Stream<List<ShelvesVO>> getShelvesList() {
    return mShelfDao
        .getAllShelvesEventStream()
        .startWith(mShelfDao.getShelfVOListStream())
        .map((event) => mShelfDao.getAllShelvesList());
  }

  @override
  void deleteShelfVO(ShelvesVO shelvesVO) {
    mShelfDao.deleteShelfVO(shelvesVO);
  }

  @override
  Stream<List<BookVO>> getBookListFromShelves(int sortingFlag, String shelfId) {
   return mShelfDao
       .getAllShelvesEventStream()
       .startWith(mShelfDao.getAllBookListStream(sortingFlag, shelfId))
       .map((event) => mShelfDao.getAllBookList(sortingFlag, shelfId));
  }

  @override
  Stream<List<BookVO>> getCategoryListFromShelves(String shelfId) {
    return mShelfDao
        .getAllShelvesEventStream()
        .startWith(mShelfDao.getAllCategoryListStream(shelfId))
        .map((event) => mShelfDao.getAllCategoryList(shelfId));
  }

  // @override
  // Stream<List<BookVO>> getBookListFromShelves(int sortingFlag) {
  //   return mShelfDao
  //       .getAllShelvesEventStream()
  //       .startWith(mShelfDao.(sortingFlag))
  //       .map((event) => mShelfDao.getAllBooks(sortingFlag));
  // }



}
