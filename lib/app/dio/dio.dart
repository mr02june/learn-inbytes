// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:inshort_clone/global/global.dart';

class GetDio {
  bool loggedIn = false;
  GetDio._();

  static Dio getDio() {
    Dio dio = Dio();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
          options
            ..connectTimeout = const Duration(seconds: 90).inMilliseconds
            ..receiveTimeout = const Duration(seconds: 90).inMilliseconds
            ..sendTimeout = const Duration(seconds: 90).inMilliseconds
            ..followRedirects = true
            ..baseUrl = "http://newsapi.org/v2/"
            ..headers["X-Api-Key"] = Global.apikey;

          handler.next(options); // Continue with the request
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) async {
          handler.next(response); // Continue with the response
        },
        onError: (DioError dioError, ErrorInterceptorHandler handler) async {
          if (dioError.type == DioErrorType.connectTimeout) {
            if (dioError.message.contains('SocketException')) {
              print("No internet");
            }
          }
          handler.next(dioError); // Continue with the error
        },
      ),
    );
    return dio;
  }
}
