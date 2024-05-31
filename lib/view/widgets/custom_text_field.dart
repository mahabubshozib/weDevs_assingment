import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../helpers/colors.dart';
import '../../helpers/styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? title;
  final String? hintText;
  final bool readOnly;
  final bool isRequired;
  final bool? obscure;
  final bool isExpand;
  final int maxLine;
  final int? maxLength;
  final Color color;
  final double borderRadius;
  final TextInputType textInputType;
  final Function? onValue;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChange;
  final List<TextInputFormatter>? inputFormatters;
  final BorderRadius? customBorder;
  final Function? onTap;

  const CustomTextField(
      {super.key,
      required this.textEditingController,
      this.title,
      this.hintText,
      this.readOnly = false,
      this.isRequired = false,
      this.isExpand = false,
      this.color = Colors.white,
      this.borderRadius = 10.0,
      this.maxLine = 1,
      this.textInputType = TextInputType.text,
      this.onValue,
      this.validator,
      this.onChange,
        this.prefixIcon,
      this.inputFormatters,
      this.suffixIcon,
      this.obscure,
      this.customBorder,
      this.maxLength = 100,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.grey,
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: TextFormField(
        obscureText: obscure ?? false,
        cursorColor: PRIMARY_COLOR,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          focusedBorder: readOnly == true
              ? OutlineInputBorder(
                  borderRadius:
                      customBorder ?? BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(
                      color: const Color(0xff000000).withOpacity(0.1),
                      width: 1.0),
                )
              : OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.withOpacity(.03), width: 1.0),
                  borderRadius:
                      customBorder ?? BorderRadius.circular(borderRadius),
                ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
            borderRadius: customBorder ?? BorderRadius.circular(borderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: customBorder ?? BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
                color: const Color(0xff000000).withOpacity(0.1), width: 1.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: customBorder ?? BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
                color: const Color(0xff000000).withOpacity(0.1), width: 1.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
            borderRadius: customBorder ?? BorderRadius.circular(borderRadius),
          ),
          contentPadding: const EdgeInsets.only(bottom: 0.0, top: 40.0),
          prefix: const Padding(
            padding: EdgeInsets.only(left: 15.0),
          ),
          errorStyle: ERROR_TEXT_STYLE,
          fillColor: color,
          filled: true,
          hintText: hintText ?? "",
          hintStyle:  TextStyle(fontSize: 15, color: GREY),
          suffixIcon: suffixIcon,
        ),
        onChanged: onChange,
        controller: textEditingController,
        readOnly: readOnly,
        validator: validator,
        keyboardType: textInputType,
        inputFormatters: inputFormatters,
        style:  TextStyle(fontSize: 15, color: GREY),
        maxLines: maxLine,
      ),
    );
  }
}
