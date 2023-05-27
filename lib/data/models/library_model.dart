import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/data/vos/category_books_list_vo.dart';
import 'package:flutter_the_library_app/data/vos/each_category_book_vo.dart';
import 'package:flutter_the_library_app/data/vos/google_book_vo.dart';
import 'package:flutter_the_library_app/data/vos/shelves_vo.dart';

abstract class LibraryModel {
  ///Network
  Future<List<CategoryBooksListVO>?> getOverviewBooksList();
  Future<List<EachCategoryBookVO>?> getEachCategoryBookListDetail(String categoryName);
  Future<List<GoogleBookVO>?> getGoogleBooksList(String searchQuery);
  ///Database
  Future<BookVO?> getBookDetails(BookVO bookVO);

  Stream<List<BookVO>> getReadBookList(int sortingFlag);

  Stream<List<BookVO>> getBookListFromShelves(String shelfId);

  Stream<List<BookVO>> getCategoryListFromShelves(String shelfId);

  Stream<List<BookVO>> getReadBookListByCategory(
      List<BookVO>? selectedCategory);

  Stream<List<BookVO>> getCategoryList();

  void createNewShelf(ShelvesVO shelvesVO);

  Stream<List<ShelvesVO>> getShelvesList();

  void deleteShelfVO(ShelvesVO shelvesVO);

  void addBookVODataToShelf(String shelfId,BookVO? bookVO);

  void deleteBookFromLibrary(BookVO bookVO);

  void renameShelf(ShelvesVO shelvesVO);

}
