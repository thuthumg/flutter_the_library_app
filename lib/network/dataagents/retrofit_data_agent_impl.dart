import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/data/vos/category_book_vo.dart';
import 'package:flutter_the_library_app/data/vos/category_books_list_vo.dart';
import 'package:flutter_the_library_app/data/vos/each_category_book_vo.dart';
import 'package:flutter_the_library_app/data/vos/google_book_vo.dart';
import 'package:flutter_the_library_app/network/api_constants.dart';
import 'package:flutter_the_library_app/network/dataagents/library_data_agent.dart';
import 'package:flutter_the_library_app/network/google_book_api.dart';
import 'package:flutter_the_library_app/network/the_library_api.dart';

class RetrofitDataAgentImpl extends LibraryDataAgent{

  late TheLibraryApi mApi;
  late GoogleBookApi mGoogleApi;

  static final RetrofitDataAgentImpl _singleton =
  RetrofitDataAgentImpl._internal();

  factory RetrofitDataAgentImpl() {
    return _singleton;
  }

  RetrofitDataAgentImpl._internal() {
    final dio = Dio();
    final interceptor = LogInterceptor(
      requestHeader: false, // don't log request headers
      requestBody: true, // don't log request body
      responseHeader: false, // don't log response headers
      responseBody: true, // log response body only
      logPrint: (message) => debugPrint(message.toString()), // use debugPrint for logging
    );
    dio.interceptors.add(interceptor);

    mApi = TheLibraryApi(dio);
    mGoogleApi = GoogleBookApi(dio);
  }

  @override
  Future<List<CategoryBooksListVO>?> getOverviewBooksList() {
   return mApi
       .getOverview(LIBRARY_API_KEY, "2022-11-14")
       .asStream().map((event) => event.results?.lists).first;
  }

  @override
  Future<List<EachCategoryBookVO>?> getLists(String categoryName) {
    return mApi
        .getLists(LIBRARY_API_KEY, categoryName)
        .asStream().map((event) => event.results).first;
  }

  @override
  Future<List<GoogleBookVO>?> getGoogleBooksList(String searchQuery) {
    return mGoogleApi
        .getGoogleBooksList(searchQuery)
        .asStream().map((event) => event.items).first;
  }


}