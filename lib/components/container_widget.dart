// import 'package:flutter/material.dart';
// import 'package:stockallref/theme/theme.dart';

// class ContainerWidget extends StatefulWidget {
//   final String title;
//   final String number;
//   final bool isAllTime;
//   final bool? isTotalRevenue;

//   const ContainerWidget({
//     super.key,
//     required this.title,
//     required this.number,
//     required this.isAllTime,
//     this.isTotalRevenue,
//   });

//   @override
//   State<ContainerWidget> createState() =>
//       _ContainerWidgetState();
// }

// class _ContainerWidgetState extends State<ContainerWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(5),
//         border: Border(
//           bottom: BorderSide(color: primaryFaint(context)),
//         ),
//       ),
//       child: Center(
//         child: Column(
//           spacing: 5,
//           children: [
//             Row(
//               mainAxisAlignment:
//                   widget.isTotalRevenue != null
//                       ? MainAxisAlignment.center
//                       : MainAxisAlignment.start,
//               children: [
//                 Text(
//                   style: TextStyle(
//                     fontSize: widget.isAllTime ? 13 : 11,
//                     color: Colors.grey.shade600,
//                   ),
//                   widget.title,
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment:
//                   widget.isTotalRevenue != null
//                       ? MainAxisAlignment.center
//                       : MainAxisAlignment.start,
//               children: [
//                 Text(
//                   textAlign: TextAlign.left,
//                   style: TextStyle(
//                     fontSize: widget.isAllTime ? 20 : 16,
//                     fontWeight: FontWeight.bold,
//                     color: primary(context),
//                   ),
//                   widget.number,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
