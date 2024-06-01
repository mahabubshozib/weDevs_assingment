import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_devs_assignment/controller/product_controller.dart';
import 'package:we_devs_assignment/view/widgets/home/product/product_card.dart';

class ProductGridWidget extends StatelessWidget {
  ProductGridWidget({super.key});

  final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: productController.productList.length,
          itemBuilder: (context, index) {
            return ProductCard(
              product: productController.productList[index],
            );
          },
        ),
      ),
    );
  }
}
