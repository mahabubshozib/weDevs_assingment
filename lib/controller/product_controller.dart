import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:we_devs_assignment/model/product.dart';
import 'package:we_devs_assignment/utils/util.dart';

class ProductController extends GetxController {
  final isLoadingAllProducts = false.obs;

  final productList = <Product>[].obs;

  Future<void> readAllProducts() async {
    try {
      isLoadingAllProducts(true);
      final String response =
          await rootBundle.loadString('assets/json/response.json');
      final data = await json.decode(response);
      productList.value =
          (data as List).map((e) => Product.fromJson(e)).toList();
      debugPrint("=====>> product list: ${productList.length}");
      isLoadingAllProducts(false);
    } catch (e) {
      showMessage(e.toString());
      isLoadingAllProducts(false);
    }
  }

  Future<void> sortByPriceHighToLow() async {
    await readAllProducts();
    productList
        .sort((a, b) => double.parse(b.price).compareTo(double.parse(a.price)));
    isLoadingAllProducts(false);
  }

  Future<void> sortByPriceLowToHigh() async {
    await readAllProducts();
    productList
        .sort((a, b) => double.parse(a.price).compareTo(double.parse(b.price)));
    isLoadingAllProducts(false);
  }

  Future<void> sortByBestSelling() async {
    await readAllProducts();
    productList.sort((a, b) => b.totalSales.compareTo(a.totalSales));
    isLoadingAllProducts(false);
  }

  Future<void> sortByNewest() async {
    await readAllProducts();
    productList.sort((a, b) {
      int aEpoch = DateTime.parse(a.dateCreated).millisecondsSinceEpoch;
      int bEpoch = DateTime.parse(b.dateCreated).millisecondsSinceEpoch;
      return bEpoch.compareTo(aEpoch);
    });
    isLoadingAllProducts(false);
  }

  Future<void> sortByOldest() async {
    await readAllProducts();
    productList.sort((a, b) {
      int aEpoch = DateTime.parse(a.dateCreated).millisecondsSinceEpoch;
      int bEpoch = DateTime.parse(b.dateCreated).millisecondsSinceEpoch;
      return aEpoch.compareTo(bEpoch);
    });
    isLoadingAllProducts(false);
  }
}
