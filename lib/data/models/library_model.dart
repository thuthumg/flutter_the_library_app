import 'package:flutter_the_library_app/data/vos/category_books_list_vo.dart';

abstract class LibraryModel{

  ///Network
  Future<List<CategoryBooksListVO>?> getOverviewBooksList();
}