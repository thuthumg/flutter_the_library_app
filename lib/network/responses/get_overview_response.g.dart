// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_overview_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOverviewResponse _$GetOverviewResponseFromJson(Map<String, dynamic> json) =>
    GetOverviewResponse(
      json['results'] == null
          ? null
          : CategoryBookVO.fromJson(json['results'] as Map<String, dynamic>),
    )..status = json['status'] as String?;

Map<String, dynamic> _$GetOverviewResponseToJson(
        GetOverviewResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'results': instance.results,
    };
