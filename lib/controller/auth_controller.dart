import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:we_devs_assignment/model/sign_up_request.dart';
import 'package:we_devs_assignment/model/user.dart';
import 'package:we_devs_assignment/service/auth_service.dart';

import '../helpers/constants.dart';
import '../model/login_request.dart';
import '../utils/util.dart';

class AuthController extends GetxController {
  final loadingUserLogin = false.obs;
  final loadingUserSignUp = false.obs;
  final signUpData =
      SignUpRequestData(username: '', email: '', password: '').obs;
  final user = User(email: '', nicename: '', displayName: '').obs;

  Future<bool> login({required LoginRequest loginRequest}) async {
    var storage = GetStorage();
    try {
      loadingUserLogin(true);
      final response = await AuthService.login(loginRequest);
      debugPrint('===>> login response: ${response.data}', wrapWidth: 1024);
      User currentUser = User(
          email: response.data['user_email'],
          nicename: response.data['user_nicename'],
          displayName: response.data['user_display_name']);
      user(currentUser);
      print('====>>>current user: ${currentUser.toJson()}');
      storage.write(AUTH_TOKEN, response.data["token"]);
      print('===>> token: $AUTH_TOKEN');
      return true;
    } catch (err) {
      print('====>> login error: ${err.toString()}');
      showMessage(err.toString());
      return false;
    } finally {
      loadingUserLogin(false);
    }
  }

  Future<bool> signup({
    required SignUpRequestData signUpRequestData,
  }) async {
    try {
      loadingUserSignUp(true);
      await AuthService.signUp(user: signUpRequestData);
      bool status = await login(
          loginRequest: LoginRequest(
              password: signUpRequestData.password,
              username: signUpRequestData.email));
      return status;
    } catch (err) {
      print('=====>>sign up error: ${err.toString()}');
      showMessage(err.toString());
      return false;
    } finally {
      loadingUserSignUp(false);
    }
  }
}
