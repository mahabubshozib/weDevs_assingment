import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_devs_assignment/controller/auth_controller.dart';
import 'package:we_devs_assignment/helpers/colors.dart';
import 'package:we_devs_assignment/helpers/constants.dart';
import 'package:we_devs_assignment/helpers/styles.dart';
import 'package:we_devs_assignment/view/widgets/profile/profile_section_widget.dart';

import '../widgets/profile/account_section.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> sections = ['Account', 'Password', 'Notification', 'Wishlist'];
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController fullNameTextEditingController =
      TextEditingController();
  final TextEditingController streetTextEditingController =
      TextEditingController();
  final TextEditingController optionalTextEditingController =
      TextEditingController();
  final TextEditingController zipCodeTextEditingController =
      TextEditingController();
  final authController = Get.find<AuthController>();

  String currentSection = '';

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      emailTextEditingController.text = authController.user.value.email;
      fullNameTextEditingController.text =
          authController.user.value.displayName;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15,top: 20, ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'My Account',
              style: myStyleSourceRoboto(
                  fontSize: 22, fontWeight: FontWeight.bold, color: NAVY_BLUE),
            ),
            VERTICAL_GAP_20,
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              child: Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/icons/circle.png'))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/unknown.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            VERTICAL_GAP_32,
            Text(
              authController.user.value.displayName,
              style: myStyleSourceRoboto(
                  fontSize: 24, fontWeight: FontWeight.bold, color: BLACK),
            ),
            Text(
              authController.user.value.email,
              style: myStyleSourceRoboto(
                  fontSize: 15, fontWeight: FontWeight.normal, color: BLACK),
            ),
            VERTICAL_GAP_32,
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                  color: WHITE,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: const Offset(3, 3), // Shadow position
                    ),
                  ]),
              child: Column(
                children: [
                  ...sections.map(
                    (e) => Column(
                      children: [
                        ProfileSectionWidget(
                          sectionName: e,
                          sectionIconPath: e == 'Account'
                              ? 'assets/icons/profile.svg'
                              : e == 'Password'
                                  ? 'assets/icons/password.svg'
                                  : e == 'Notification'
                                      ? 'assets/icons/ring.svg'
                                      : 'assets/icons/heart.svg',
                          onPress: (value) {
                            if (e != currentSection) {
                              currentSection = value;
                            } else {
                              currentSection = '';
                            }
                            setState(() {});
                          },
                          isActive: e == currentSection,
                          widget: currentSection == 'Account'
                              ? AccountSection(
                                  emailTextFieldController:
                                      emailTextEditingController,
                                  fullNameTextFieldController:
                                      fullNameTextEditingController,
                                  streetAddressTextFieldController:
                                      streetTextEditingController,
                                  optionalTextFieldController:
                                      optionalTextEditingController,
                                  zipCodeTextFieldController:
                                      zipCodeTextEditingController,
                                  cancelPress: () {
                                    setState(() {
                                      currentSection = '';
                                    });
                                  },
                                  savePress: () {},
                                )
                              : const SizedBox(),
                        ),
                        if (e != 'Wishlist') const Divider()
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}
