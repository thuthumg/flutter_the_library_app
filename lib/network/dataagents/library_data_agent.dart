import 'package:flutter_the_library_app/data/vos/category_books_list_vo.dart';

abstract class LibraryDataAgent{
 Future<List<CategoryBooksListVO>?>  getOverviewBooksList();
 //  getLists();
}