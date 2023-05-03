// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_books_list_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryBooksListVO _$CategoryBooksListVOFromJson(Map<String, dynamic> json) =>
    CategoryBooksListVO(
      json['list_id'] as int?,
      json['list_name'] as String?,
      json['list_name_encoded'] as String?,
      json['display_name'] as String?,
      json['updated'] as String?,
      (json['books'] as List<dynamic>?)
          ?.map((e) => BookVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryBooksListVOToJson(
        CategoryBooksListVO instance) =>
    <String, dynamic>{
      'list_id': instance.listId,
      'list_name': instance.listName,
      'list_name_encoded': instance.listNameEncoded,
      'display_name': instance.displayName,
      'updated': instance.updated,
      'books': instance.books,
    };
