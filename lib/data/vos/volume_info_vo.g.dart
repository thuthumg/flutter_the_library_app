// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volume_info_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VolumeInfoVO _$VolumeInfoVOFromJson(Map<String, dynamic> json) => VolumeInfoVO(
      json['title'] as String?,
      (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['publisher'] as String?,
      json['publishedDate'] as String?,
      json['description'] as String?,
      (json['categories'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['imageLinks'] == null
          ? null
          : ImageLinkVO.fromJson(json['imageLinks'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VolumeInfoVOToJson(VolumeInfoVO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'authors': instance.authors,
      'publisher': instance.publisher,
      'publishedDate': instance.publishedDate,
      'description': instance.description,
      'categories': instance.categories,
      'imageLinks': instance.imageLinks,
    };
