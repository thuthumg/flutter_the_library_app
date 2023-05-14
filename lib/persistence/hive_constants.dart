import 'package:uuid/uuid.dart';

//Hive Types
const int HIVE_TYPE_ID_BOOK_VO = 1;
const int HIVE_TYPE_ID_SHELVES_VO = 2;

//Box Names
const String BOX_NAME_BOOK_VO = "BOX_NAME_BOOK_VO";
const String BOX_NAME_SHELVES_VO = "BOX_NAME_SHELVES_VO";

String generateCurrentTimeUuid() {
  var uuid = Uuid();
  var currentTime = DateTime.now().millisecondsSinceEpoch;
  var uuidString = uuid.v1(options: {'msec': currentTime});
  return uuidString;
}


DateTime get timestamp {
  final seconds = int.parse(generateCurrentTimeUuid().substring(0, 8), radix: 16);
  final milliseconds = seconds * 1000;
  return DateTime.fromMillisecondsSinceEpoch(milliseconds);
}