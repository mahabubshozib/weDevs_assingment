import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarItem extends StatelessWidget {
  final String svgPath;
  final Function onPress;
  final Color color;
  const NavBarItem({super.key, required this.svgPath, required this.onPress, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: SvgPicture.asset(svgPath, color: color,),
    );
  }
}
