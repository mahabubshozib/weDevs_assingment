import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:we_devs_assignment/controller/product_controller.dart';
import 'package:we_devs_assignment/helpers/colors.dart';
import 'package:we_devs_assignment/helpers/constants.dart';
import 'package:we_devs_assignment/helpers/styles.dart';

import '../../../controller/product_controller.dart';
import '../custom_primary_button.dart';
import '../custom_secondary_button.dart';

class CustomFilterWidget extends StatefulWidget {
  const CustomFilterWidget({Key? key}) : super(key: key);

  @override
  _CustomFilterWidgetState createState() => _CustomFilterWidgetState();
}

class _CustomFilterWidgetState extends State<CustomFilterWidget> {
  final productController = Get.find<ProductController>();


  final List<String> _filterOptions = [
    'Newest',
    'Oldest',
    'Price low > High',
    'Price high > Low',
    'Best selling'
  ];
  String selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TOTAL_HEIGHT * 0.5,
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          VERTICAL_GAP_20,
          SvgPicture.asset('assets/icons/pink_bar.svg'),
          VERTICAL_GAP_20,
          ..._filterOptions.map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                child: Row(
                  children: [
                    CustomCheckbox(
                      value: e,
                      onChanged: (String value) {
                        setState(() {
                          selectedOption = value;
                        });
                      },
                      select: e == selectedOption,
                    ),
                    HORIZONTAL_GAP_8,
                    Text(
                      e,
                      style: myStyleSourceRoboto(
                        fontSize: 15,
                        color: BLACK,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              )),
          VERTICAL_GAP_20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomSecondaryButton(
                onPressed: () {
                  Get.back();
                },
                width: TOTAL_WIDTH * .3,
                borderColor: GREY_4.withOpacity(0.6),
                child: Text(
                  'Cancel',
                  style: myStyleSourceRoboto(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff607374)),
                ),
              ),
              CustomPrimaryButton(
                onPressed: () {
                  if(selectedOption == 'Newest') productController.sortByNewest();
                  if(selectedOption == 'Oldest') productController.sortByOldest();
                  if(selectedOption == 'Price low > High') productController.sortByPriceLowToHigh();
                  if(selectedOption == 'Price high > Low') productController.sortByPriceHighToLow();
                  if(selectedOption == 'Best selling') productController.sortByBestSelling();
                  Get.back();
                },
                color: GREEN,
                width: TOTAL_WIDTH * .3,
                child: Text(
                  'Apply',
                  style: myStyleSourceRoboto(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: WHITE,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CustomCheckbox extends StatelessWidget {
  final String value;
  final bool select;
  final Function(String) onChanged;

  CustomCheckbox(
      {required this.value, required this.onChanged, required this.select});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Container(
        decoration: BoxDecoration(
          color: select ? PRIMARY_LIGHT_COLOR : Colors.transparent,
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
            color: PRIMARY_LIGHT_COLOR,
            width: 2.0,
          ),
        ),
        width: 24.0,
        height: 24.0,
        child: select
            ? const Center(
                child: Icon(
                  Icons.check,
                  size: 14.0,
                  color: Colors.white,
                ),
              )
            : null,
      ),
    );
  }
}
