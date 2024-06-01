import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../helpers/colors.dart';
import '../../../helpers/constants.dart';
import '../../../helpers/styles.dart';

class ProfileSectionWidget extends StatelessWidget {
  final String sectionName;
  final String sectionIconPath;
  final Function onPress;
  final bool isActive;
  final Widget? widget;

  const ProfileSectionWidget(
      {super.key,
      required this.sectionName,
      required this.sectionIconPath,
      required this.onPress,
      this.widget,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress(sectionName);
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      sectionIconPath,
                      // e == 'Account'
                      //     ? 'assets/icons/profile.svg'
                      //     : e == 'Password'
                      //     ? 'assets/icons/password.svg'
                      //     : e == 'Notification'
                      //     ? 'assets/icons/notification.svg'
                      //     : 'assets/icons/heart.svg',
                      color: GREY,
                    ),
                    HORIZONTAL_GAP_10,
                    Text(
                      sectionName,
                      style: myStyleSourceRoboto(
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                          color: BLACK),
                    ),
                  ],
                ),
                Icon(
                  isActive
                      ? Icons.keyboard_arrow_down_outlined
                      : Icons.keyboard_arrow_right,
                  color: GREY,
                  size: 17,
                )
              ],
            ),
            if(isActive)
              Padding(padding: EdgeInsets.only(top: 10),
              child: widget ?? const SizedBox())
          ],
        ),
      ),
    );
  }
}
