import 'package:get/get.dart';
import 'package:we_devs_assignment/view/screens/home_screen.dart';
import 'package:we_devs_assignment/view/screens/sign_up_screen.dart';


import '../view/screens/initial_screen.dart';
import '../view/screens/sign_in_screen.dart';
import 'route_url.dart';

final List<GetPage<dynamic>> RoutePages = [
  GetPage(
    name: "/",
    page: () =>  HomeScreen(),
    children: [
      // GetPage(
      //   name: loginScreen,
      //   page: () => SignInScreen(),
      //   transition: Transition.zoom,
      //   transitionDuration: const Duration(milliseconds: 400),
      // ),
      GetPage(
        name: signUpScreen,
        page: () => const SignUpScreen(),
        transition: Transition.zoom,
        transitionDuration:  Duration(milliseconds: 400),
      ),
      // GetPage(
      //   name: homeScreen,
      //   page: () => const HomeScreen(),
      //   transition: Transition.zoom,
      //   transitionDuration:  Duration(milliseconds: 400),
      // ),
    ],
  )
];
