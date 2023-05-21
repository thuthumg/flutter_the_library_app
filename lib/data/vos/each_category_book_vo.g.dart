// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'each_category_book_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EachCategoryBookVO _$EachCategoryBookVOFromJson(Map<String, dynamic> json) =>
    EachCategoryBookVO(
      json['list_name'] as String?,
      json['display_name'] as String?,
      json['bestsellers_date'] as String?,
      json['published_date'] as String?,
      (json['book_details'] as List<dynamic>?)
          ?.map((e) => BookDetailVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EachCategoryBookVOToJson(EachCategoryBookVO instance) =>
    <String, dynamic>{
      'list_name': instance.listName,
      'display_name': instance.displayName,
      'bestsellers_date': instance.bestsellersDate,
      'published_date': instance.publishedDate,
      'book_details': instance.bookDetails,
    };
