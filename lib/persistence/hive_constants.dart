import 'package:uuid/uuid.dart';

//Hive Types
const int HIVE_TYPE_ID_BOOK_VO = 1;


//Box Names
const String BOX_NAME_BOOK_VO = "BOX_NAME_BOOK_VO";


String generateCurrentTimeUuid() {
  var uuid = Uuid();
  var currentTime = DateTime.now().millisecondsSinceEpoch;
  var uuidString = uuid.v1(options: {'msec': currentTime});
  return uuidString;
}