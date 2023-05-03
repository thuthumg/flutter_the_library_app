// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_book_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryBookVO _$CategoryBookVOFromJson(Map<String, dynamic> json) =>
    CategoryBookVO(
      json['bestsellers_date'] as String?,
      json['published_date'] as String?,
      json['published_date_description'] as String?,
      json['previous_published_date'] as String?,
      json['next_published_date'] as String?,
      (json['lists'] as List<dynamic>?)
          ?.map((e) => CategoryBooksListVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryBookVOToJson(CategoryBookVO instance) =>
    <String, dynamic>{
      'bestsellers_date': instance.bestsellersDate,
      'published_date': instance.publishedDate,
      'published_date_description': instance.publishedDateDescription,
      'previous_published_date': instance.previousPublishedDate,
      'next_published_date': instance.nextPublishedDate,
      'lists': instance.lists,
    };
