// import 'package:flutter/material.dart';
// import 'package:stockallref/theme/theme.dart';

// class MainButtonTransparent extends StatelessWidget {
//   final String text;
//   final Function() action;
//   const MainButtonTransparent({
//     super.key,
//     required this.text,
//     required this.action,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: Ink(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//           color: Colors.white,
//           border: Border.all(color: primary(context)),
//         ),
//         child: InkWell(
//           onTap: () {
//             action();
//             FocusManager.instance.primaryFocus?.unfocus();
//           },
//           child: Container(
//             padding: EdgeInsets.symmetric(vertical: 15),

//             child: Center(
//               child: Text(
//                 style: TextStyle(
//                   color: primary(context),
//                   fontWeight: FontWeight.w600,
//                 ),
//                 text,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
