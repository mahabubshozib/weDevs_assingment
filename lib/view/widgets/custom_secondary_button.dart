import 'package:flutter/material.dart';
import 'package:we_devs_assignment/helpers/constants.dart';

import '../../helpers/colors.dart';

class CustomSecondaryButton extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Color? borderColor;
  final double height;
  final double? width;
  final Function onPressed;

  const CustomSecondaryButton(
      {required this.child,
        this.color,
        this.height = 52,
        required this.onPressed, this.borderColor, this.width});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(width: 1,color: borderColor ?? Theme.of(context).primaryColor)
      ),
      minWidth: width ?? TOTAL_WIDTH,
      height: height,
      onPressed: () => onPressed(),
      color: color ?? WHITE,
      child: child,
    );
  }
}
