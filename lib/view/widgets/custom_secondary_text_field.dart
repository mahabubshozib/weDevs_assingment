import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../helpers/colors.dart';
import '../../helpers/styles.dart';


class CustomSecondaryTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? title;
  final String? placeHolder;
  final bool readOnly;
  final bool isRequired;
  final bool isExpand;
  final int maxLine;
  final Color color;
  final double borderRadius;
  final TextInputType textInputType;
  final Function? onValue;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChange;
  final List<TextInputFormatter>? inputFormatters;

  const CustomSecondaryTextField(
      {super.key, required this.textEditingController,
      this.title,
      this.placeHolder,
      this.readOnly = false,
      this.isRequired = false,
      this.isExpand = false,
      this.color = Colors.transparent,
      this.borderRadius = 10.0,
      this.maxLine = 1,
      this.textInputType = TextInputType.text,
      this.onValue,
      this.validator,
      this.onChange,
      this.inputFormatters,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide:  BorderSide(color: PRIMARY_COLOR, width: 1.0),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
              color: const Color(0xff000000).withOpacity(0.1), width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        // label: Text(
        //   title ?? "",
        //   style: const TextStyle(
        //     fontWeight: FontWeight.w400,
        //     fontSize: 12,
        //     color: NEUTRAL_N100,
        //   ),
        // ),
        contentPadding: const EdgeInsets.all(15),
        errorStyle: ERROR_TEXT_STYLE,
        fillColor: color,
        filled: true,
        hintText: placeHolder ?? "",
        hintStyle: Theme.of(context).textTheme.bodySmall,
        suffixIcon: suffixIcon,
      ),
      // onChanged: (value) => onValue != null ? onValue!(value) : null,
      onChanged: onChange,
      controller: textEditingController,
      readOnly: readOnly,
      validator: validator,
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
      style:  TextStyle(fontSize: 15, color: BLACK),
      maxLines: maxLine,
    );
  }
}
