import 'package:flutter/material.dart';

import '../../../helpers/colors.dart';
import '../../../helpers/constants.dart';
import '../../../helpers/styles.dart';
import '../custom_primary_button.dart';
import '../custom_secondary_button.dart';
import '../custom_secondary_text_field.dart';

class AccountSection extends StatelessWidget {
  final TextEditingController fullNameTextFieldController;
  final TextEditingController emailTextFieldController;
  final TextEditingController streetAddressTextFieldController;
  final TextEditingController optionalTextFieldController;
  final TextEditingController zipCodeTextFieldController;
  final Function cancelPress;
  final Function savePress;
  const AccountSection({super.key, required this.fullNameTextFieldController, required this.emailTextFieldController, required this.streetAddressTextFieldController, required this.optionalTextFieldController, required this.zipCodeTextFieldController, required this.cancelPress, required this.savePress});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: myStyleSourceRoboto(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: GREY_3,
          ),
        ),
        VERTICAL_GAP_10,
        CustomSecondaryTextField(
            textEditingController:
            emailTextFieldController),
        VERTICAL_GAP_10,
        Text(
          'Full Name',
          style: myStyleSourceRoboto(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: GREY_3,
          ),
        ),
        VERTICAL_GAP_10,
        CustomSecondaryTextField(
            textEditingController:
            fullNameTextFieldController),
        VERTICAL_GAP_10,
        Text(
          'Street Address',
          style: myStyleSourceRoboto(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: GREY_3,
          ),
        ),
        VERTICAL_GAP_10,
        CustomSecondaryTextField(
            textEditingController:
            streetAddressTextFieldController),
        VERTICAL_GAP_10,
        Text(
          'Apt, Suite, Bldg (optional)',
          style: myStyleSourceRoboto(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: GREY_3,
          ),
        ),
        VERTICAL_GAP_10,
        CustomSecondaryTextField(
            textEditingController:
            optionalTextFieldController),
        VERTICAL_GAP_10,
        Text(
          'Zip Code',
          style: myStyleSourceRoboto(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: GREY_3,
          ),
        ),
        VERTICAL_GAP_10,
        CustomSecondaryTextField(
            textEditingController:
            zipCodeTextFieldController),
        VERTICAL_GAP_10,
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceEvenly,
          children: [
            CustomSecondaryButton(
              onPressed: () {},
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
              onPressed: () {},
              color: GREEN,
              width: TOTAL_WIDTH * .3,
              child: Text(
                'Save',
                style: myStyleSourceRoboto(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: WHITE,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
