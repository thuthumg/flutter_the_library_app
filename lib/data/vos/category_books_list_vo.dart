import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:json_annotation/json_annotation.dart';


part 'category_books_list_vo.g.dart';

@JsonSerializable()
class CategoryBooksListVO{
  @JsonKey(name: "list_id")
  int? listId;

  @JsonKey(name: "list_name")
  String? listName;

  @JsonKey(name: "list_name_encoded")
  String? listNameEncoded;

  @JsonKey(name: "display_name")
  String? displayName;

  @JsonKey(name: "updated")
  String? updated;

  @JsonKey(name: "books")
  List<BookVO>? books;


  CategoryBooksListVO(this.listId, this.listName, this.listNameEncoded,
      this.displayName, this.updated, this.books);

  factory CategoryBooksListVO.fromJson(Map<String,dynamic> json) =>_$CategoryBooksListVOFromJson(json);
  Map<String,dynamic> toJson()=> _$CategoryBooksListVOToJson(this);


}