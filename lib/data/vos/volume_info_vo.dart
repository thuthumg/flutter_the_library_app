
import 'package:flutter_the_library_app/data/vos/image_link_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'volume_info_vo.g.dart';

@JsonSerializable()
class VolumeInfoVO{

  @JsonKey(name: "title")
    String? title;

  @JsonKey(name: "authors")
  List<String>?  authors;

  @JsonKey(name: "publisher")
  String? publisher;

  @JsonKey(name: "publishedDate")
  String? publishedDate;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "categories")
  List<String>? categories;

  @JsonKey(name: "imageLinks")
   ImageLinkVO? imageLinks;

  VolumeInfoVO(this.title, this.authors, this.publisher, this.publishedDate,
      this.description, this.categories, this.imageLinks);

  factory VolumeInfoVO.fromJson(Map<String,dynamic> json) =>_$VolumeInfoVOFromJson(json);
  Map<String,dynamic> toJson()=> _$VolumeInfoVOToJson(this);

}