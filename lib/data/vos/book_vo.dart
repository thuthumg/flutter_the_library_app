import 'package:json_annotation/json_annotation.dart';


part 'book_vo.g.dart';

@JsonSerializable()
class BookVO{

  @JsonKey(name: "category_id")
  int? categoryId;

  @JsonKey(name: "category_name")
  String? categoryName;

  @JsonKey(name: "author")
  String? author;

  @JsonKey(name: "book_image")
  String? bookImage;

  @JsonKey(name: "book_image_width")
  int? bookImageWidth;

  @JsonKey(name: "book_image_height")
  int? bookImageHeight;

  @JsonKey(name: "book_review_link")
  String? bookReviewLink;

  @JsonKey(name: "contributor")
  String? contributor;

  @JsonKey(name: "contributor_note")
  String? contributorNote;

  @JsonKey(name: "created_date")
  String? createdDate;


  @JsonKey(name: "description")
  String? description;


  @JsonKey(name: "price")
  String? price;

  @JsonKey(name: "book_uri")
  String? book_uri;


  @JsonKey(name: "publisher")
  String? publisher;

  @JsonKey(name: "title")
  String? title;


  @JsonKey(name: "updated_date")
  String? updatedDate;


  BookVO(
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