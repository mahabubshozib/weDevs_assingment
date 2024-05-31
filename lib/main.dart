import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_devs_assignment/controller/auth_controller.dart';
import 'package:we_devs_assignment/view/screens/sign_in_screen.dart';

import 'helpers/Route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'weDevs Assignment',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: RoutePages,
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());

      }),
    );
  }
}
