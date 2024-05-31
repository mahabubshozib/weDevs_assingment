import 'package:flutter/material.dart';

import '../../../helpers/colors.dart';
import '../../../helpers/constants.dart';

class SignUpImageSection extends StatelessWidget {
  const SignUpImageSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: TOTAL_WIDTH,
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(color: WHITE, shape: BoxShape.circle),
          child: Image.asset(
            'assets/icons/profile.png',
            height: 30,
            width: 30,
          ),
        ),
        Positioned(
          bottom: 3,
          right: 95,
          child: Container(
            height: 34,
            width: 34,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Color(0xffF2709C),
                  Color(0xffFF9472),
                ],
              ),
            ),
            child: Icon(
              Icons.camera_alt,
              color: WHITE,
              size: 15,
            ),
          ),
        ),
      ],
    );
  }
}
