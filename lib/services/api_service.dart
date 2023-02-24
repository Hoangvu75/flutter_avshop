import 'dart:io';

import 'package:avshop/models/av_actress_response.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import '../generated/app_utils.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService create() {
    final dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.options.connectTimeout = 60000;
    dio.interceptors.add(PrettyDioLogger());

    return ApiService(
      dio,
      baseUrl: baseUrl,
    );
  }

  @GET("/api/actress")
  Future<AvActressResponse> getTrendingAvActress(@Query("name") String name, @Query("hits") String hits);

  @GET("/api/actress/{id}")
  Future<AvActress> getAvActressById(@Path("id") String actressId);
}
