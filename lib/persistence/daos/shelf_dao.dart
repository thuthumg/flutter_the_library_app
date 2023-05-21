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
    return getShelfBox().put(shelvesVO.shelfId, shelvesVO);
  }

  void saveBookListDataToShelfVO(String shelfId, BookVO? bookVO) async
  {
    List<ShelvesVO> shelvesVOList= getShelfBox().values.where((element) => element.shelfId == shelfId).toList();
    if( shelvesVOList[0].booksList?.length == 0)
      {
        shelvesVOList[0].booksList?.add(bookVO!);
      }else if ( (shelvesVOList[0].booksList?.length)! > 0){

      // Using contains method
      List<BookVO> booksList = shelvesVOList[0].booksList??[];
      bool isContained = booksList.contains(bookVO);

      if(!isContained)
        {
          shelvesVOList[0].booksList?.add(bookVO!);
        }

    }

    // var existingData = getShelfBox().get('key');
    // var updatedData = modifyData(existingData);
    // await getShelfBox().put('key', updatedData);///remain
    return getShelfBox().put(shelvesVOList[0].shelfId, shelvesVOList[0]);
  }
  dynamic modifyData(dynamic existingData) {
    // Perform modifications on the existing data and return the updated data
    return existingData;
  }
  void deleteShelfVO(ShelvesVO shelvesVO) async {
    return getShelfBox().delete(shelvesVO.shelfId);
  }


  List<BookVO> getAllBookList(String shelfId)
  {
    List<ShelvesVO> shelvesVOList= getShelfBox().values.where((element) => element.shelfId == shelfId).toList();
    return shelvesVOList[0].booksList??[];
  }

  List<BookVO> getAllCategoryList(String shelfId){
    if (getAllBookList(shelfId) != null && (getAllBookList(shelfId).isNotEmpty ?? false)) {

      List<BookVO> distinctBooks = [];

      getAllBookList(shelfId).forEach((book) {
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

    List<ShelvesVO> shelfListData = getShelfBox().values.toList();
    List<ShelvesVO> returnShelfData = [];
    for (int i = 0; i< shelfListData.length;i++) {
      shelfListData[i].booksList?.sort((a, b) => (a.bookId??"").compareTo(b.bookId??""));
      returnShelfData.add(shelfListData[i]);
    }

    return  getShelfBox().values.toList();
  }


  ///Reactive Programming
  Stream<void> getAllShelvesEventStream() {
    return getShelfBox().watch();
  }

  Stream<List<ShelvesVO>> getShelfVOListStream() {
    return Stream.value(getAllShelvesList().toList());
  }

Stream<List<BookVO>> getAllBookListStream(String shelfId){
    return Stream.value(getAllBookList(shelfId).toList());
}

  Stream<List<BookVO>> getAllCategoryListStream(String shelfId) {
    // final distinctData = getBookBox().values.map((item) => item.categoryName).toSet().toList();

    return Stream.value(getAllCategoryList(shelfId).toSet().toList());
  }


}