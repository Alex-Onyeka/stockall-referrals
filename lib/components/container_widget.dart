import 'package:flutter/material.dart';
import 'package:stockallref/theme/theme.dart';

class ContainerWidget extends StatelessWidget {
  final String title;
  final String number;
  final bool isAllTime;
  final bool? isTotalRevenue;

  const ContainerWidget({
    super.key,
    required this.title,
    required this.number,
    required this.isAllTime,
    this.isTotalRevenue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border(
          bottom: BorderSide(color: primaryFaint(context)),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment:
                  isTotalRevenue != null
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
              children: [
                Text(
                  style: TextStyle(
                    fontSize: isAllTime ? 14 : 12,
                    color: Colors.grey.shade600,
                  ),
                  title,
                ),
              ],
            ),
            Row(
              mainAxisAlignment:
                  isTotalRevenue != null
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: isAllTime ? 25 : 18,
                    fontWeight: FontWeight.bold,
                    color: primary(context),
                  ),
                  number,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
