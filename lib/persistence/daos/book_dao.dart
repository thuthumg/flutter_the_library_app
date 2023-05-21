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
   // bookVO.bookId = UniqueKey().toString();
    bookVO.selected = false;

    debugPrint("check uuid "+generateCurrentTimeUuid());
    List<BookVO> bookList = getAllBooks(1);
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
        return getBookBox().put(bookVO.bookId, bookVO);
      }else{
      return getBookBox().put(bookVO.bookId, bookVO);
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

  List<BookVO> getAllBooks(int sortingFlag) {

    final data = getBookBox().values.toList();
    List<BookVO> bookList;
    switch(sortingFlag)
    {
      case 1:
        data.sort((a, b) => (a.bookId??"").compareTo(b.bookId??""));
        data.reversed;
        break;
      case 2:
        data.sort((a,b) => (a.title??"").compareTo(b.title??""));
        break;
      case 3:
        data.sort((a,b) => (a.author??"").compareTo(b.author??""));
        break;
      default:
        data.sort((a, b) => a.bookId?.compareTo(b.bookId??"")??0);
    }

    return  data;
  }

  List<BookVO> getAllBooksByCategory(List<BookVO>? selectedCategoryBookList) {

    final data = getBookBox().values.toList();
    List<BookVO> selectedDataList = [];

    selectedCategoryBookList?.forEach((selectedCategoryObj) {
      selectedDataList.addAll(data.where((element) => element.categoryId == selectedCategoryObj.categoryId).toList());
    });

    return  selectedDataList;
  }

/*
  List<BookVO> getCategoryList(){
    if (getAllBooks(1) != null && (getAllBooks(1).isNotEmpty ?? false)) {

      List<BookVO> distinctBooks = [];

      getAllBooks(1).forEach((book) {
        if (distinctBooks.isEmpty || !distinctBooks.any((distinctBook) => distinctBook.categoryId == book.categoryId)) {
          distinctBooks.add(book);
        }
      });

      print(distinctBooks);

      return distinctBooks;

      *//*  getAllBooks(1)
         // .map((bookVO) => bookVO.categoryName??"")
          .toSet()
          .toList();*//*

    } else {
      return [];
    }
  }*/

  List<BookVO> getCategoryList(){
    if (getAllBooks(1) != null && (getAllBooks(1).isNotEmpty ?? false)) {

      List<BookVO> distinctBooks = [];

      getAllBooks(1).forEach((book) {
        if (distinctBooks.isEmpty || !distinctBooks.any((distinctBook) => distinctBook.categoryId == book.categoryId)) {
          distinctBooks.add(book);
        }
      });

      print(distinctBooks);

      return distinctBooks;

      /*  getAllBooks(1)
         // .map((bookVO) => bookVO.categoryName??"")
          .toSet()
          .toList();*/

    } else {
      return [];
    }
  }


  Box<BookVO> getBookBox() {
    return Hive.box<BookVO>(BOX_NAME_BOOK_VO);
  }

  ///Reactive Programming
  Stream<void> getAllBooksEventStream() {
    return getBookBox().watch();
  }

  Stream<List<BookVO>> getBookVOListStream(int sortingFlag) {
    return Stream.value(getAllBooks(sortingFlag).toList());
  }

  Stream<List<BookVO>> getBookVOListByCategoryStream(List<BookVO>? selectedCategoryBookList) {
    return Stream.value(getAllBooksByCategory(selectedCategoryBookList).toList());
  }


  Stream<List<BookVO>> getCategoryListStream() {
    // final distinctData = getBookBox().values.map((item) => item.categoryName).toSet().toList();
    return Stream.value(getCategoryList().toSet().toList());
  }


}
