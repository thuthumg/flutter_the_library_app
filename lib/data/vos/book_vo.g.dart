// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookVO _$BookVOFromJson(Map<String, dynamic> json) => BookVO(
      json['category_id'] as int?,
      json['category_name'] as String?,
      json['author'] as String?,
      json['book_image'] as String?,
      json['book_image_width'] as int?,
      json['book_image_height'] as int?,
      json['book_review_link'] as String?,
      json['contributor'] as String?,
      json['contributor_note'] as String?,
      json['created_date'] as String?,
      json['description'] as String?,
      json['price'] as String?,
      json['book_uri'] as String?,
      json['publisher'] as String?,
      json['title'] as String?,
      json['updated_date'] as String?,
    );

Map<String, dynamic> _$BookVOToJson(BookVO instance) => <String, dynamic>{
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'author': instance.author,
      'book_image': instance.bookImage,
      'book_image_width': instance.bookImageWidth,
      'book_image_height': instance.bookImageHeight,
      'book_review_link': instance.bookReviewLink,
      'contributor': instance.contributor,
      'contributor_note': instance.contributorNote,
      'created_date': instance.createdDate,
      'description': instance.description,
      'price': instance.price,
      'book_uri': instance.book_uri,
      'publisher': instance.publisher,
      'title': instance.title,
      'updated_date': instance.updatedDate,
    };
