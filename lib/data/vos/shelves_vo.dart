import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/persistence/hive_constants.dart';
import 'package:hive_flutter/adapters.dart';

part 'shelves_vo.g.dart';

@HiveType(typeId: HIVE_TYPE_ID_SHELVES_VO, adapterName: "ShelvesVOAdapter")
class ShelvesVO{

  @HiveField(0)
  int? shelfId;

  @HiveField(1)
  String? shelfName;

  @HiveField(2)
  List<BookVO>? booksList;

  @HiveField(3)
  bool isSelected = false;

  ShelvesVO(this.shelfId, this.shelfName, this.booksList, this.isSelected);

  @override
  String toString() {
    return 'ShelvesVO{shelfId: $shelfId, shelfName: $shelfName, booksList: $booksList, isSelected: $isSelected}';
  }
}