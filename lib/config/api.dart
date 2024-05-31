import 'package:dio/dio.dart';

import '../helpers/api_url.dart';

class Api {

  Dio dio = Dio();

  Api() {
    dio = Dio(
      BaseOptions(
        baseUrl: BASE_API_URL,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );


    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler)  {
          print("${options.method} : ${options.uri}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioError error, handler) {

          return handler.next(error);
        },
      ),
    );
  }
}