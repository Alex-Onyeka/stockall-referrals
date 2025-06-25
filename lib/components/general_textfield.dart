// import 'package:flutter/material.dart';
// import 'package:stockallref/theme/theme.dart';

// class GeneralTextfield extends StatelessWidget {
//   final TextEditingController controller;
//   final String label;
//   final bool? isPhone;
//   const GeneralTextfield({
//     super.key,
//     required this.controller,
//     required this.label,
//     this.isPhone,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       textCapitalization: TextCapitalization.words,
//       style: TextStyle(fontSize: 15),
//       keyboardType:
//           isPhone != null
//               ? TextInputType.phone
//               : TextInputType.text,
//       autocorrect: true,
//       autofocus: false,
//       decoration: InputDecoration(
//         labelStyle: TextStyle(
//           color: Colors.grey.shade400,
//           fontSize: 14,
//         ),
//         floatingLabelStyle: TextStyle(
//           color: primary(context),
//           fontSize: 12,
//           fontWeight: FontWeight.bold,
//         ),
//         labelText: label,
//         contentPadding: EdgeInsets.symmetric(
//           horizontal: 15,
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.grey.shade400,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: primary(context),
//             width: 1.3,
//           ),
//         ),
//       ),
//     );
//   }
// }
