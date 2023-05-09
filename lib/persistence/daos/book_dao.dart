import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/persistence/hive_constants.dart';
import 'package:hive/hive.dart';

class BookDao {
  static final BookDao _singleton = BookDao._internal();

  factory BookDao() {
    return _singleton;
  }

  BookDao._internal();

  void saveBookVO(BookVO bookVO) async {
    bookVO.bookId = generateCurrentTimeUuid();

    debugPrint("check uuid "+generateCurrentTimeUuid());
    List<BookVO> bookList = getAllBooks();
    if(bookList.isNotEmpty && bookList.length > 0)
      {

        for(int i=0; i<bookList.length;i++)
          {
            if(bookList[i].categoryId == bookVO.categoryId &&
                bookList[i].title == bookVO.title &&
                bookList[i].author == bookVO.author)
              {
                getBookBox().deleteAt(i);
              }
          }

        // bookList.forEach((BookVO bookVOData) {
        //   if(bookVOData.categoryId == bookVO.categoryId &&
        //   bookVOData.title == bookVO.title &&
        //   bookVOData.author == bookVO.author)
        //     {
        //
        //
        //       deleteItem(bookVOData.bookId??"");
        //
        //     }
        // });
        return getBookBox().put(generateCurrentTimeUuid(), bookVO);
      }else{
      return getBookBox().put(generateCurrentTimeUuid(), bookVO);
    }


  }
 // void deleteItem(String uuidString) {
 //   // final box = Hive.box<BookVO>("deliveries");
 //
 //    final Map<dynamic, BookVO> deliveriesMap = getBookBox().toMap();
 //    dynamic desiredKey;
 //
 //    deliveriesMap.forEach((key, value){
 //      debugPrint("check delete null case " +value.bookId.toString()+"////"+uuidString);
 //      if (value.bookId == uuidString)
 //        desiredKey = key;
 //    });
 //    debugPrint("check delete null case " +desiredKey);
 //   // if(desiredKey != null)
 //    getBookBox().delete(desiredKey);
 //  }

  BookVO? getBookById(int bookId) {
    return getBookBox().get(bookId);
  }

  List<BookVO> getAllBooks() {
    return getBookBox().values.toList();
  }



  Box<BookVO> getBookBox() {
    return Hive.box<BookVO>(BOX_NAME_BOOK_VO);
  }

  ///Reactive Programming
  Stream<void> getAllBooksEventStream() {
    return getBookBox().watch();
  }

  Stream<List<BookVO>> getBookVOListStream() {
    return Stream.value(getAllBooks().toList());
  }


}
