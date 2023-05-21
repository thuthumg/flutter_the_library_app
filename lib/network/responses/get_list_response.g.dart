// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetListResponse _$GetListResponseFromJson(Map<String, dynamic> json) =>
    GetListResponse(
      json['status'] as String?,
      (json['results'] as List<dynamic>?)
          ?.map((e) => EachCategoryBookVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetListResponseToJson(GetListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'results': instance.results,
    };
