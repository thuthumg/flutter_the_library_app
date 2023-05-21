import 'package:flutter_the_library_app/data/vos/each_category_book_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_list_response.g.dart';

@JsonSerializable()
class GetListResponse{

  @JsonKey(name: "status")
  String? status;


  @JsonKey(name: "results")
  List<EachCategoryBookVO>? results;


  GetListResponse(this.status, this.results);

  factory  GetListResponse.fromJson(Map<String,dynamic> json) =>_$GetListResponseFromJson(json);
  Map<String,dynamic> toJson()=> _$GetListResponseToJson(this);


}


