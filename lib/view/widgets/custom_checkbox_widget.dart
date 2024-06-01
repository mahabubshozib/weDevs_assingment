// import 'package:flutter/material.dart';
//
// import '../../helpers/colors.dart';
// import '../../helpers/constants.dart';
// import '../../helpers/styles.dart';
//
// class CustomStringCheckbox extends StatelessWidget {
//   final String value;
//   final bool isSelected;
//   final Function(String) onChanged;
//
//   const CustomStringCheckbox({
//     Key? key,
//     required this.value,
//     required this.isSelected,
//     required this.onChanged,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SizedBox(
//           height: 20,
//           width: 20,
//           child: Checkbox(
//             value: isSelected,
//             onChanged: (value) => onChanged(value),
//             activeColor: PRIMARY_LIGHT_COLOR,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(4.0),
//             ),
//             side: MaterialStateBorderSide.resolveWith(
//                   (states) => BorderSide(
//                 width: 2.0,
//                 color: PRIMARY_LIGHT_COLOR,
//               ),
//             ),
//           ),
//         ),
//         HORIZONTAL_GAP_8,
//         Text(
//           value,
//           style: myStyleSourceRoboto(
//             fontSize: 15,
//             color: BLACK,
//             fontWeight: FontWeight.w400,
//           ),
//         )
//       ],
//     );
//   }
// }