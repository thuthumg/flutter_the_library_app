
import 'package:flutter_the_library_app/data/vos/category_books_list_vo.dart';
import 'package:json_annotation/json_annotation.dart';


part 'category_book_vo.g.dart';

@JsonSerializable()
class CategoryBookVO
{
  @JsonKey(name: "bestsellers_date")
  String? bestsellersDate;

  @JsonKey(name: "published_date")
  String? publishedDate;

  @JsonKey(name: "published_date_description")
  String? publishedDateDescription;

  @JsonKey(name: "previous_published_date")
  String? previousPublishedDate;

  @JsonKey(name: "next_published_date")
  String? nextPublishedDate;

  @JsonKey(name: "lists")
  List<CategoryBooksListVO>? lists;


  CategoryBookVO(
      this.bestsellersDate,
      this.publishedDate,
      this.publishedDateDescription,
      this.previousPublishedDate,
      this.nextPublishedDate,
      this.lists);

  factory CategoryBookVO.fromJson(Map<String,dynamic> json) =>_$CategoryBookVOFromJson(json);
  Map<String,dynamic> toJson()=> _$CategoryBookVOToJson(this);


}