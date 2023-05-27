import 'package:flutter_the_library_app/data/vos/book_detail_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'each_category_book_vo.g.dart';

@JsonSerializable()
class EachCategoryBookVO {

  @JsonKey(name: "list_name")
  String? listName;

  @JsonKey(name: "display_name")
  String? displayName;

  @JsonKey(name: "bestsellers_date")
  String? bestsellersDate;

  @JsonKey(name: "published_date")
  String? publishedDate;

  @JsonKey(name: "book_details")
  List<BookDetailVO>? bookDetails;

  EachCategoryBookVO(this.listName, this.displayName, this.bestsellersDate,
      this.publishedDate, this.bookDetails);

  factory EachCategoryBookVO.fromJson(Map<String,dynamic> json) =>_$EachCategoryBookVOFromJson(json);
  Map<String,dynamic> toJson()=> _$EachCategoryBookVOToJson(this);


}