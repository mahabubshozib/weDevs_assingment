import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_devs_assignment/controller/keeper_controller.dart';
import 'package:we_devs_assignment/helpers/constants.dart';

import '../../../../helpers/colors.dart';
import 'nav_bar_item.dart';

class CustomNavBar extends StatelessWidget {
  CustomNavBar({super.key});

  final keeperController = Get.find<KeeperController>();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: BottomAppBar(
        color: WHITE,
        elevation: 10,
        shadowColor: GREY.withOpacity(0.2),
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Obx(() => NavBarItem(
                svgPath: 'assets/icons/home.svg',
                onPress: () {
                  keeperController.navBarIndex.value = 0;
                },
                color: keeperController.navBarIndex.value == 0
                    ? PRIMARY_COLOR
                    : const Color(0xff6E7FAA))),
            Obx(() => NavBarItem(
                svgPath: 'assets/icons/grid.svg',
                onPress: () {
                  keeperController.navBarIndex.value = 1;
                },
                color: keeperController.navBarIndex.value == 1
                    ? PRIMARY_COLOR
                    : const Color(0xff6E7FAA))),
            HORIZONTAL_GAP_32,
            Obx(() => NavBarItem(
                svgPath: 'assets/icons/cart.svg',
                onPress: () {
                  keeperController.navBarIndex.value = 2;
                },
                color: keeperController.navBarIndex.value == 2
                    ? PRIMARY_COLOR
                    : const Color(0xff6E7FAA))),
            Obx(() => NavBarItem(
                svgPath: 'assets/icons/profile.svg',
                onPress: () {
                  keeperController.navBarIndex.value = 3;
                },
                color: keeperController.navBarIndex.value == 3
                    ? PRIMARY_COLOR
                    : const Color(0xff6E7FAA))),
          ],
        ),
      ),
    );
  }
}
