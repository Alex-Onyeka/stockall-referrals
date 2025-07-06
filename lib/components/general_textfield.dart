// import 'package:flutter/material.dart';
// import 'package:stockallref/theme/theme.dart';

// class GeneralTextfield extends StatelessWidget {
//   final TextEditingController controller;
//   final String label;
//   final bool? isPhone;
//   final bool? isActive;
//   final Function(String)? onChanged;
//   const GeneralTextfield({
//     super.key,
//     required this.controller,
//     required this.label,
//     this.isPhone,
//     this.isActive,
//     this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       onChanged: onChanged,
//       enabled: isActive ?? true,
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
