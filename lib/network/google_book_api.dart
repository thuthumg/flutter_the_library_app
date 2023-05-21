import 'package:dio/dio.dart';
import 'package:flutter_the_library_app/network/api_constants.dart';
import 'package:flutter_the_library_app/network/responses/get_google_books_response.dart';
import 'package:retrofit/http.dart';

part 'google_book_api.g.dart';

@RestApi(baseUrl: GOOGLE_BASE_URL)
abstract class GoogleBookApi{

  factory GoogleBookApi(Dio dio) = _GoogleBookApi;

  @GET(ENDPOINT_GET_VOLUMES)
  Future<GetGoogleBooksResponse> getGoogleBooksList(
      @Query(PARAM_Q) String q
      );


}