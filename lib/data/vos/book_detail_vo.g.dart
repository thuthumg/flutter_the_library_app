// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_detail_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookDetailVO _$BookDetailVOFromJson(Map<String, dynamic> json) => BookDetailVO(
      json['title'] as String?,
      json['description'] as String?,
      json['contributor'] as String?,
      json['author'] as String?,
      json['contributor_note'] as String?,
      json['price'] as String?,
      json['age_group'] as String?,
      json['publisher'] as String?,
    );

Map<String, dynamic> _$BookDetailVOToJson(BookDetailVO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'contributor': instance.contributor,
      'author': instance.author,
      'contributor_note': instance.contributorNote,
      'price': instance.price,
      'age_group': instance.ageGroup,
      'publisher': instance.publisher,
    };
