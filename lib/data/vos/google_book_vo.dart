
import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/data/vos/volume_info_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'google_book_vo.g.dart';

@JsonSerializable()
class GoogleBookVO{

  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "volumeInfo")
  VolumeInfoVO? volumeInfo;

  GoogleBookVO(this.id, this.volumeInfo);

  factory GoogleBookVO.fromJson(Map<String,dynamic> json) =>_$GoogleBookVOFromJson(json);
  Map<String,dynamic> toJson()=> _$GoogleBookVOToJson(this);

  BookVO convertBookVO(String bookid)
  {
    return BookVO(bookid,
        null,
        null,
        volumeInfo?.authors?.join(","),
        volumeInfo?.imageLinks?.smallThumbnail,
        60,
        80,
        "",
        "",
        "",
        volumeInfo?.publishedDate,
        volumeInfo?.description,
        "0.0",
        "",
        volumeInfo?.publisher,
        volumeInfo?.title,
        volumeInfo?.publishedDate,
        false);

  }


}