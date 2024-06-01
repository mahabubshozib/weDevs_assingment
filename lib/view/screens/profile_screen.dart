import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:we_devs_assignment/helpers/colors.dart';
import 'package:we_devs_assignment/helpers/constants.dart';
import 'package:we_devs_assignment/helpers/styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> sections = ['Account', 'Password', 'Notification', 'Wishlist'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'My Account',
              style: myStyleSourceRoboto(
                  fontSize: 22, fontWeight: FontWeight.bold, color: NAVY_BLUE),
            ),
            VERTICAL_GAP_20,
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              child: Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/icons/circle.png'))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/unknown.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            VERTICAL_GAP_32,
            Text(
              'John Smith',
              style: myStyleSourceRoboto(
                  fontSize: 24, fontWeight: FontWeight.bold, color: BLACK),
            ),
            Text(
              'info@johnsmith.com',
              style: myStyleSourceRoboto(
                  fontSize: 15, fontWeight: FontWeight.normal, color: BLACK),
            ),
            VERTICAL_GAP_32,
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                  color: WHITE,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: const Offset(3, 3), // Shadow position
                    ),
                  ]),
              child: Column(
                children: [
                  ...sections.map(
                    (e) => Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    e == 'Account'
                                        ? 'assets/icons/profile.svg'
                                        : e == 'Password'
                                            ? 'assets/icons/password.svg'
                                            : e == 'Notification'
                                                ? 'assets/icons/notification.svg'
                                                : 'assets/icons/heart.svg',
                                    color: GREY,
                                  ),
                                  HORIZONTAL_GAP_10,
                                  Text(
                                    e,
                                    style: myStyleSourceRoboto(
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal,
                                        color: BLACK),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: GREY,
                                size: 17,
                              )
                            ],
                          ),
                        ),
                        if(e != 'Wishlist')
                        const Divider()
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
