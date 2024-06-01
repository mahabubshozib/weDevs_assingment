import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_devs_assignment/helpers/colors.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? const CupertinoActivityIndicator()
        : CircularProgressIndicator(
            color: PRIMARY_COLOR,
          );
  }
}
