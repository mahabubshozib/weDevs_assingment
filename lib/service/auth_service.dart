import 'package:dio/dio.dart';
import 'package:we_devs_assignment/helpers/api_url.dart';

import '../config/api.dart';
import '../model/login_request.dart';
import '../model/sign_up_request.dart';

class AuthService {
  static Future<Response> login(LoginRequest loginRequest) async {
    return await Api().dio.post(
      USER_LOGIN_API_URL,
      options: Options(
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
      queryParameters: {
        'username': loginRequest.username,
        'password': loginRequest.password,
      },
    );
  }

  static Future<Response> signUp({required SignUpRequestData user}) async {
    return await Api().dio.post(
          USER_SIGN_UP_API_URL,
          data: user.toJson(),
        );
  }
}
