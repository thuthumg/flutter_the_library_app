import 'package:dio/dio.dart';
import 'package:flutter_the_library_app/network/api_constants.dart';
import 'package:flutter_the_library_app/network/responses/get_overview_response.dart';
import 'package:retrofit/retrofit.dart';
part 'the_library_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class TheLibraryApi{

  factory TheLibraryApi(Dio dio) = _TheLibraryApi;

  @GET(ENDPOINT_GET_OVERVIEW)
  Future<GetOverviewResponse> getOverview(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_PUBLISHED_DATE) String publishedDate
      );

}