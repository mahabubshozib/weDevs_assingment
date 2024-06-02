import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:we_devs_assignment/controller/keeper_controller.dart';
import 'package:we_devs_assignment/controller/product_controller.dart';
import 'package:we_devs_assignment/helpers/colors.dart';
import 'package:we_devs_assignment/helpers/constants.dart';
import 'package:we_devs_assignment/helpers/styles.dart';
import 'package:we_devs_assignment/view/screens/profile_screen.dart';
import 'package:we_devs_assignment/view/widgets/home/custom_filter_widget.dart';
import 'package:we_devs_assignment/view/widgets/home/product/product_grid_widget.dart';
import 'package:we_devs_assignment/view/widgets/home/product/product_list_widget.dart';

import '../widgets/home/navbar/custom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
  final productController = Get.find<ProductController>();
  final keeperController = Get.find<KeeperController>();

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      productController.readAllProducts();
      print('length: ${productController.productList.length}');
    });
    super.initState();
  }

  List<Widget> screens = [
    const ProductListWidget(),
    Container(),
    const SizedBox(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Obx(() => screens[keeperController.navBarIndex.value])),
      backgroundColor: Color(0xffF8F8F8),
      bottomNavigationBar: CustomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          backgroundColor: PRIMARY_COLOR,
          onPressed: () {
            showFilterModalSheet(context);
          },
          child: SvgPicture.asset('assets/icons/search.svg')),
    );
  }

  showFilterModalSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        transitionAnimationController: AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 800),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(0),
          ),
        ),
        builder: (context) {
          return const CustomFilterWidget();
        });
  }
}
