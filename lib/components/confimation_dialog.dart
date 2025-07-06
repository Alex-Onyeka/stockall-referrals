// import 'package:flutter/material.dart';
// import 'package:stockallref/theme/theme.dart';

// class ConfirmationDialog extends StatelessWidget {
//   final String title;
//   final String text;
//   final Function() action;

//   const ConfirmationDialog({
//     super.key,
//     required this.title,
//     required this.text,
//     required this.action,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       // contentPadding: EdgeInsets.all(0),
//       shape: BeveledRectangleBorder(
//         borderRadius: BorderRadius.circular(5),
//       ),
//       title: Text(
//         style: TextStyle(
//           fontSize: 20,
//           color: primary(context),
//           fontWeight: FontWeight.bold,
//         ),
//         title,
//       ),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           // SizedBox(height: 10),
//           Text(style: TextStyle(color: Colors.grey), text),
//           SizedBox(height: 20),
//           Row(
//             spacing: 10,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: InkWell(
//                   borderRadius: BorderRadius.circular(5),
//                   onTap: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(
//                         5,
//                       ),
//                     ),
//                     padding: EdgeInsets.symmetric(
//                       vertical: 10,
//                     ),
//                     child: Center(
//                       child: Text(
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         'Cancel',
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Ink(
//                   decoration: BoxDecoration(
//                     color: primary(context),
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: InkWell(
//                     onTap: action,
//                     child: Container(
//                       padding: EdgeInsets.symmetric(
//                         vertical: 10,
//                       ),
//                       child: Center(
//                         child: Text(
//                           style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                           'Proceed',
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
