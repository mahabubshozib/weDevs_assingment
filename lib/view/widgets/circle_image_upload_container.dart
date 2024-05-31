import 'package:flutter/material.dart';

class CircleImageUploadContainer extends StatelessWidget {
  final String src;
  final bool isAssetsImage;
  final bool avatar;
  final double radius;
  final double size;
  final Color color;
  const CircleImageUploadContainer({super.key, required this.src, required this.isAssetsImage, required this.avatar, required this.radius, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage(src),
      radius: radius,
      backgroundColor: color,
    );
  }
}
