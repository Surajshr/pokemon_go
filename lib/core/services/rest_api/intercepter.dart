import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pokemon_go/utils/common_utils.dart';

InterceptorsWrapper generateHeaderInterceptor(Dio dio) {
  return InterceptorsWrapper(onRequest: (options, handler) async {
    if (options.headers[HttpHeaders.contentLengthHeader] == -1) {
      options.headers.remove(HttpHeaders.contentLengthHeader);
    } else {
      dPrint('hostNameOfAlgolia:${Uri.parse(options.path).host}');
      options.headers['Host'] = Uri.parse(options.path).host;
      options.headers['Accept-Encoding'] = 'gzip, deflate, br';
      options.headers['Connection'] = 'keep-alive';
      options.headers['Accept'] = '*/*';
    }
    return handler.next(options);
  }, onError: (DioException error, handler) {
    if (error.response?.statusCode == 400) {
      dPrint('badRequest status code :$error');
    }
    return handler.next(error);
  });
}
