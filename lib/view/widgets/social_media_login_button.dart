import 'package:flutter/material.dart';
import 'package:we_devs_assignment/helpers/colors.dart';

class SocialMediaLoginButton extends StatelessWidget {
  final String imagePath;
  final Function onPress;

  const SocialMediaLoginButton({super.key, required this.imagePath, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        height: 56,
        width: 56,
        decoration: BoxDecoration(
          color: WHITE,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset(imagePath),
      ),
    );
  }
}
