import 'package:flutter/foundation.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/data/vos/shelves_vo.dart';
import 'package:flutter_the_library_app/persistence/hive_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ShelfDao {
  static final ShelfDao _singleton = ShelfDao._internal();

  factory ShelfDao() {
    return _singleton;
  }

  ShelfDao._internal();

  void saveShelfVO(ShelvesVO shelvesVO) async {

    print("save shelf function = "+shelvesVO.shelfName.toString());
    shelvesVO.shelfId = UniqueKey().toString();
    return getShelfBox().put(UniqueKey().toString(), shelvesVO);
  }

  void deleteShelfVO(ShelvesVO shelvesVO) async {

    return getShelfBox().delete(shelvesVO.shelfId);
  }


  List<BookVO> getAllBookList(int sortingFlag,String shelfId)

  {
    List<ShelvesVO> shelvesVOList= getShelfBox().values.where((element) => element.shelfId == shelfId).toList();

    return shelvesVOList[0].booksList??[];
  }

  List<BookVO> getAllCategoryList(String shelfId){
    if (getAllBookList(1,shelfId) != null && (getAllBookList(1,shelfId).isNotEmpty ?? false)) {

      List<BookVO> distinctBooks = [];

      getAllBookList(1,shelfId).forEach((book) {
        if (distinctBooks.isEmpty || !distinctBooks.any((distinctBook) => distinctBook.categoryId == book.categoryId)) {
          distinctBooks.add(book);
        }
      });

      print(distinctBooks);

      return distinctBooks;

    } else {
      return [];
    }
  }


  Box<ShelvesVO> getShelfBox() {
    return Hive.box<ShelvesVO>(BOX_NAME_SHELVES_VO);
  }

  List<ShelvesVO> getAllShelvesList() {
    return  getShelfBox().values.toList();
  }


  ///Reactive Programming
  Stream<void> getAllShelvesEventStream() {
    return getShelfBox().watch();
  }

  Stream<List<ShelvesVO>> getShelfVOListStream() {
    return Stream.value(getAllShelvesList().toList());
  }

Stream<List<BookVO>> getAllBookListStream(int sortingFlag,String shelfId){
    return Stream.value(getAllBookList(sortingFlag, shelfId).toList());
}

  Stream<List<BookVO>> getAllCategoryListStream(String shelfId) {
    // final distinctData = getBookBox().values.map((item) => item.categoryName).toSet().toList();

    return Stream.value(getAllCategoryList(shelfId).toSet().toList());
  }


}