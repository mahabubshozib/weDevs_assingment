import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:we_devs_assignment/controller/auth_controller.dart';
import 'package:we_devs_assignment/helpers/colors.dart';
import 'package:we_devs_assignment/helpers/constants.dart';
import 'package:we_devs_assignment/helpers/route_url.dart';
import 'package:we_devs_assignment/model/sign_up_request.dart';
import 'package:we_devs_assignment/utils/util.dart';
import 'package:we_devs_assignment/view/widgets/custom_primary_button.dart';
import 'package:we_devs_assignment/view/widgets/custom_text_field.dart';

import '../../helpers/styles.dart';
import '../widgets/custom_loading.dart';
import '../widgets/sign_up/sign_up_image_section.dart';
import '../widgets/social_media_login_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameTextFieldController = TextEditingController();
  final TextEditingController emailTextFieldController =
      TextEditingController();
  final TextEditingController passwordTextFieldController =
      TextEditingController();
  final TextEditingController confirmPasswordTextFieldController =
      TextEditingController();

  final authController = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();

  signUp() async {
    if (checkField()) {
      bool status = await authController.signup(
          signUpRequestData: SignUpRequestData(
              username: nameTextFieldController.text.trim(),
              email: emailTextFieldController.text.trim(),
              password: passwordTextFieldController.text));

      if (status) {
        nameTextFieldController.clear();
        emailTextFieldController.clear();
        passwordTextFieldController.clear();
        confirmPasswordTextFieldController.clear();
        showSuccessMessage(message: 'User sign up successfully...');
        Get.offAllNamed(homeScreen);
      }
    } else {
      showMessage('Please check your form carefully');
    }
  }

  bool checkField() {
    bool valid = true;
    if (nameTextFieldController.text.isEmpty) {
      valid = false;
    }
    if (emailTextFieldController.text.isEmpty) {
      valid = false;
    }
    if (passwordTextFieldController.text.isEmpty) {
      valid = false;
    }
    if (confirmPasswordTextFieldController.text.isEmpty ||
        passwordTextFieldController.text !=
            confirmPasswordTextFieldController.text) {
      valid = false;
    }
    return valid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SCAFFOLD_BACKGROUND,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SignUpImageSection(),
                VERTICAL_GAP_20,
                CustomTextField(
                  textEditingController: nameTextFieldController,
                  hintText: 'Name',
                  prefixIcon: Padding(
                    padding:
                        const EdgeInsets.only(left: 5.0, bottom: 12, top: 12),
                    child: SvgPicture.asset(
                      'assets/icons/profile.svg',
                      height: 5,
                      color: Color(0xff7C8592),
                    ),
                  ),
                ),
                VERTICAL_GAP_16,
                CustomTextField(
                  textEditingController: emailTextFieldController,
                  hintText: 'Email',
                  prefixIcon: Padding(
                    padding:
                        const EdgeInsets.only(left: 5.0, bottom: 12, top: 12),
                    child: SvgPicture.asset(
                      'assets/icons/email.svg',
                      height: 5,
                    ),
                  ),
                ),
                VERTICAL_GAP_16,
                CustomTextField(
                  textEditingController: passwordTextFieldController,
                  hintText: 'Password',
                  prefixIcon: Padding(
                    padding:
                        const EdgeInsets.only(left: 5.0, bottom: 12, top: 12),
                    child: SvgPicture.asset(
                      'assets/icons/password.svg',
                      height: 5,
                    ),
                  ),
                ),
                VERTICAL_GAP_16,
                CustomTextField(
                  textEditingController: confirmPasswordTextFieldController,
                  hintText: 'Confirm Password',
                  prefixIcon: Padding(
                    padding:
                        const EdgeInsets.only(left: 5.0, bottom: 12, top: 12),
                    child: SvgPicture.asset(
                      'assets/icons/password.svg',
                      height: 5,
                    ),
                  ),
                ),
                VERTICAL_GAP_32,
                Obx(
                  () => authController.loadingUserSignUp.value
                      ? const CustomLoading()
                      : CustomPrimaryButton(
                          color: PRIMARY_COLOR,
                          height: 60,
                          child: Text(
                            'Sign Up',
                            style: myStyleSourceRoboto(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: WHITE),
                          ),
                          onPressed: () {
                            signUp();
                          },
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
                      onPress: () {},
                    ),
                  ],
                ),
                VERTICAL_GAP_20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: myStyleSourceRoboto(fontSize: 17),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offNamed('/');
                      },
                      child: Text(
                        'Login',
                        style: myStyleSourceRoboto(
                            fontSize: 17,
                            color: BLUE,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
