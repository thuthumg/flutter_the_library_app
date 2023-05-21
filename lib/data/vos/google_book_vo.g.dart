// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_book_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleBookVO _$GoogleBookVOFromJson(Map<String, dynamic> json) => GoogleBookVO(
      json['id'] as String?,
      json['volumeInfo'] == null
          ? null
          : VolumeInfoVO.fromJson(json['volumeInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GoogleBookVOToJson(GoogleBookVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'volumeInfo': instance.volumeInfo,
    };
