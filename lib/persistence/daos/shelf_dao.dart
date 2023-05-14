import 'package:flutter/foundation.dart';
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

}