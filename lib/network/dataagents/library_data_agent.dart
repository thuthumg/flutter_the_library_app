import 'package:flutter_the_library_app/data/vos/category_books_list_vo.dart';
import 'package:flutter_the_library_app/data/vos/each_category_book_vo.dart';
import 'package:flutter_the_library_app/data/vos/google_book_vo.dart';

abstract class LibraryDataAgent{
 Future<List<CategoryBooksListVO>?>  getOverviewBooksList();
 Future<List<EachCategoryBookVO>?>  getLists(String categoryName);
 Future<List<GoogleBookVO>?> getGoogleBooksList(String searchQuery);

}