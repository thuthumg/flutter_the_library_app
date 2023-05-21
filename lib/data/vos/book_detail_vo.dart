
import 'package:json_annotation/json_annotation.dart';

part 'book_detail_vo.g.dart';

@JsonSerializable()
class BookDetailVO{

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "contributor")
  String? contributor;

  @JsonKey(name: "author")
  String? author;

  @JsonKey(name: "contributor_note")
  String? contributorNote;

  @JsonKey(name: "price")
  String? price;

  @JsonKey(name: "age_group")
  String? ageGroup;

  @JsonKey(name: "publisher")
  String? publisher;


  BookDetailVO(this.title, this.description, this.contributor, this.author,
      this.contributorNote, this.price, this.ageGroup, this.publisher);

  factory BookDetailVO.fromJson(Map<String,dynamic> json) =>_$BookDetailVOFromJson(json);
  Map<String,dynamic> toJson()=> _$BookDetailVOToJson(this);
}