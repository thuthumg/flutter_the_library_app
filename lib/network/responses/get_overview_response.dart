import 'package:flutter_the_library_app/data/vos/category_book_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_overview_response.g.dart';

@JsonSerializable()
class GetOverviewResponse{

  @JsonKey(name: "status")
  String? status;


  @JsonKey(name: "results")
  CategoryBookVO? results;


  GetOverviewResponse(this.results);

  factory GetOverviewResponse.fromJson(Map<String,dynamic> json) =>_$GetOverviewResponseFromJson(json);
  Map<String,dynamic> toJson()=> _$GetOverviewResponseToJson(this);


}


