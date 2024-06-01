import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:we_devs_assignment/controller/product_controller.dart';
import 'package:we_devs_assignment/helpers/colors.dart';
import 'package:we_devs_assignment/helpers/constants.dart';
import 'package:we_devs_assignment/helpers/styles.dart';
import 'package:we_devs_assignment/view/widgets/home/product/product_grid_widget.dart';

import '../widgets/home/navbar/custom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final productController = Get.find<ProductController>();

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      productController.readAllProducts();
      print('length: ${productController.productList.length}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: TOTAL_HEIGHT,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  productController.readAllProducts();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    Text(
                      'Product List',
                      style: myStyleSourceRoboto(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: NAVY_BLUE),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/icons/search.svg',
                      color: BLACK,
                    )
                  ],
                ),
              ),
              VERTICAL_GAP_20,
              SizedBox(
                height: 70,
                child: Card(
                  color: WHITE,
                  elevation: 5,
                  child: Row(
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/icons/filter.svg'),
                        label: Text(
                          'Filter',
                          style: myStyleSourceRoboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: GREY_2),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              'Sort by',
                              style: myStyleSourceRoboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: GREY_2),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: GREY_2,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.list),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              VERTICAL_GAP_20,
              ProductGridWidget(),

            ],
          ),
        ),
      ),
      backgroundColor: SCAFFOLD_BACKGROUND,
      bottomNavigationBar: CustomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          backgroundColor: PRIMARY_COLOR,
          onPressed: () {},
          child: SvgPicture.asset('assets/icons/search.svg')),
    );
  }
}

class FilterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(Icons.filter_list),
      label: Text('Filter'),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

class SortButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(Icons.sort),
      label: Text('Sort by'),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
