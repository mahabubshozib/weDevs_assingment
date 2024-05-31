import 'package:flutter/material.dart';

import '../../helpers/colors.dart';



class CustomPrimaryButton extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double height;
  final Function onPressed;
  final bool disable;
  final bool? bordered;

  const CustomPrimaryButton(
      {required this.child,
        this.color,
        this.height = 52 ,
        this.disable = false,
        required this.onPressed, this.bordered});

  @override
  Widget build(BuildContext context) {

    return MaterialButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: bordered == true ? PRIMARY_COLOR : Colors.transparent)),
      minWidth: double.infinity,
      height: height,
      onPressed: disable?null:() => onPressed(),
      color: color ?? Theme.of(context).primaryColor,
      child: child,
      disabledColor:Color(0xff494848),
      disabledTextColor: BLACK,
    );
  }
}
