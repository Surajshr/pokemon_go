import 'package:dio/dio.dart';

class NetworkUtils{
  static Duration networkTimeoutMilliseconds = const Duration(seconds: 3000);
  static Dio createDioInstance() => Dio(
    BaseOptions(
      connectTimeout: networkTimeoutMilliseconds,
      receiveTimeout: networkTimeoutMilliseconds,
    ),
  );

}