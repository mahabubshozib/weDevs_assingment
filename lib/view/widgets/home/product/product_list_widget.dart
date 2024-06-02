import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:we_devs_assignment/controller/keeper_controller.dart';
import 'package:we_devs_assignment/controller/product_controller.dart';

import '../../../../helpers/colors.dart';
import '../../../../helpers/constants.dart';
import '../../../../helpers/styles.dart';
import 'product_grid_widget.dart';

class ProductListWidget extends StatelessWidget {
  ProductListWidget({Key? key}) : super(key: key);

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final productController = Get.find<ProductController>();
  final keeperController = Get.find<KeeperController>();

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      controller: _refreshController,
      onRefresh: () {
        keeperController.activeFilter(false);
        productController.readAllProducts();
        _refreshController.refreshCompleted();
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: TOTAL_HEIGHT,
        color: const Color(0xffF8F8F8),
        child: Column(
          children: [
            VERTICAL_GAP_20,
            Row(
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
            Container(
              height: 110,
            ),
          ],
        ),
      ),
    );
  }
}
