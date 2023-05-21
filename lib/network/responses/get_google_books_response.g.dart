// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_google_books_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGoogleBooksResponse _$GetGoogleBooksResponseFromJson(
        Map<String, dynamic> json) =>
    GetGoogleBooksResponse(
      (json['items'] as List<dynamic>?)
          ?.map((e) => GoogleBookVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetGoogleBooksResponseToJson(
        GetGoogleBooksResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
