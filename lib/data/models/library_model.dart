import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/data/vos/category_books_list_vo.dart';

abstract class LibraryModel{

  ///Network
  Future<List<CategoryBooksListVO>?> getOverviewBooksList();


  ///Database
 Future<BookVO?> getBookDetails(BookVO bookVO);
 Stream<List<BookVO>> getReadBookList(int sortingFlag);
  Stream<List<BookVO>> getReadBookListByCategory(List<BookVO>? selectedCategory);
  Stream<List<BookVO>> getCategoryList();
}