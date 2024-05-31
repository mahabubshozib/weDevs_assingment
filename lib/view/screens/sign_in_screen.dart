import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_devs_assignment/helpers/colors.dart';
import 'package:we_devs_assignment/helpers/constants.dart';
import 'package:we_devs_assignment/helpers/route_url.dart';
import 'package:we_devs_assignment/view/widgets/custom_text_field.dart';
import 'package:we_devs_assignment/view/widgets/social_media_login_button.dart';

import '../../helpers/styles.dart';
import '../widgets/custom_primary_button.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SCAFFOLD_BACKGROUND,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/dokan_logo.png',
                    height: 150,
                    width: 150,
                  ),
                ),
                VERTICAL_GAP_32,
                Text(
                  'Sign In',
                  style: myStyleSourceRoboto(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                VERTICAL_GAP_32,
                CustomTextField(
                  textEditingController: emailTextEditingController,
                  hintText: 'Email',
                  prefixIcon: Padding(
                    padding:
                        const EdgeInsets.only(left: 5.0, bottom: 14, top: 14),
                    child: Image.asset(
                      'assets/icons/email.png',
                      height: 10,
                    ),
                  ),
                ),
                VERTICAL_GAP_20,
                CustomTextField(
                  textEditingController: passwordTextEditingController,
                  prefixIcon: Padding(
                    padding:
                        const EdgeInsets.only(left: 5.0, bottom: 10, top: 10),
                    child: Image.asset(
                      'assets/icons/password.png',
                      height: 10,
                    ),
                  ),
                  hintText: 'Password',
                  suffixIcon: Icon(Icons.remove_red_eye, color: GREY,),
                ),
                VERTICAL_GAP_20,
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password?',
                    style: myStyleSourceRoboto(fontSize: 13, color: GREY),
                  ),
                ),
                VERTICAL_GAP_32,
                CustomPrimaryButton(
                  color: PRIMARY_COLOR,
                  height: 60,
                  onPressed: () {},
                  child: Text(
                    "Login",
                    style: myStyleSourceRoboto(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: WHITE),
                  ),
                ),
                VERTICAL_GAP_20,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaLoginButton(
                      imagePath: 'assets/icons/fb.png',
                      onPress: () {},
                    ),
                    HORIZONTAL_GAP_20,
                    SocialMediaLoginButton(
                      imagePath: 'assets/icons/google.png',
                      onPress: () {

                      },
                    ),
                  ],
                ),
                VERTICAL_GAP_32,
                TextButton(
                  onPressed: () {
                    Get.toNamed(signUpScreen);
                  },
                  child: Text(
                    'Create New Account',
                    style: myStyleSourceRoboto(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xff383C40),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
