// import 'package:flutter/material.dart';
// import 'package:stockallref/theme/theme.dart';

// class TextFieldPassword extends StatefulWidget {
//   final TextEditingController controller;
//   final String label;
//   const TextFieldPassword({
//     super.key,
//     required this.controller,
//     required this.label,
//   });

//   @override
//   State<TextFieldPassword> createState() =>
//       _TextFieldPasswordState();
// }

// class _TextFieldPasswordState
//     extends State<TextFieldPassword> {
//   bool isVisible = false;
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: widget.controller,
//       style: TextStyle(fontSize: 15),
//       keyboardType: TextInputType.visiblePassword,
//       obscureText: !isVisible,
//       autocorrect: false,
//       autofocus: false,
//       decoration: InputDecoration(
//         suffixIcon: IconButton(
//           onPressed: () {
//             setState(() {
//               isVisible = !isVisible;
//             });
//           },
//           icon: Icon(
//             size: 20,
//             color: Colors.grey.shade700,
//             !isVisible
//                 ? Icons.visibility_outlined
//                 : Icons.visibility_off_outlined,
//           ),
//         ),
//         labelStyle: TextStyle(
//           color: Colors.grey.shade400,
//           fontSize: 14,
//         ),
//         floatingLabelStyle: TextStyle(
//           color: primary(context),
//           fontSize: 12,
//           fontWeight: FontWeight.bold,
//         ),
//         labelText: widget.label,
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
