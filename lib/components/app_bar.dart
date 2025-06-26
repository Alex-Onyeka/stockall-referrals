import 'package:flutter/material.dart';
import 'package:stockallref/theme/theme.dart';

class TopNavBar extends StatelessWidget {
  final String title;
  final Widget? widget;
  final double amount;
  const TopNavBar({
    super.key,
    required this.title,
    this.widget,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.fromLTRB(
        15,
        amount,
        15,
        amount + 5,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Row(
        mainAxisAlignment:
            widget != null
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.start,
        children: [
          Row(
            spacing: 5,
            children: [
              SizedBox(
                height: 35,
                child: CircleAvatar(
                  child: Icon(size: 18, Icons.person),
                ),
              ),
              Row(
                children: [
                  Text(
                    style: TextStyle(fontSize: 12),
                    'Hello, ',
                  ),
                  Text(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primary(context),
                    ),
                    title.split(' ').length > 1
                        ? title.split(' ')[0].toUpperCase()
                        : title.toUpperCase(),
                  ),
                ],
              ),
            ],
          ),
          widget ?? Container(),
        ],
      ),
    );
  }
}
