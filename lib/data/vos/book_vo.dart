import 'package:flutter_the_library_app/persistence/hive_constants.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'book_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_BOOK_VO, adapterName: "BookVOAdapter")
class BookVO{

  @HiveField(0)
  String? bookId;

 // @JsonKey(name: "category_id")
  @HiveField(1)
  int? categoryId;

 // @JsonKey(name: "category_name")
  @HiveField(2)
  String? categoryName;

  @JsonKey(name: "author")
  @HiveField(3)
  String? author;

  @JsonKey(name: "book_image")
  @HiveField(4)
  String? bookImage;

  @JsonKey(name: "book_image_width")
  @HiveField(5)
  int? bookImageWidth;

  @JsonKey(name: "book_image_height")
  @HiveField(6)
  int? bookImageHeight;

  @JsonKey(name: "book_review_link")
  @HiveField(7)
  String? bookReviewLink;

  @JsonKey(name: "contributor")
  @HiveField(8)
  String? contributor;

  @JsonKey(name: "contributor_note")
  @HiveField(9)
  String? contributorNote;

  @JsonKey(name: "created_date")
  @HiveField(10)
  String? createdDate;


  @JsonKey(name: "description")
  @HiveField(11)
  String? description;


  @JsonKey(name: "price")
  @HiveField(12)
  String? price;

  @JsonKey(name: "book_uri")
  @HiveField(13)
  String? book_uri;


  @JsonKey(name: "publisher")
  @HiveField(14)
  String? publisher;

  @JsonKey(name: "title")
  @HiveField(15)
  String? title;


  @JsonKey(name: "updated_date")
  @HiveField(16)
  String? updatedDate;


  BookVO(
      this.bookId,
      this.categoryId,
      this.categoryName,
      this.author,
      this.bookImage,
      this.bookImageWidth,
      this.bookImageHeight,
      this.bookReviewLink,
      this.contributor,
      this.contributorNote,
      this.createdDate,
      this.description,
      this.price,
      this.book_uri,
      this.publisher,
      this.title,
      this.updatedDate);

  factory BookVO.fromJson(Map<String,dynamic> json) =>_$BookVOFromJson(json);
  Map<String,dynamic> toJson()=> _$BookVOToJson(this);


}