import 'package:flutter/material.dart';
import 'package:stockallref/theme/theme.dart';

class TextFieldEmail extends StatelessWidget {
  final TextEditingController controller;
  const TextFieldEmail({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(fontSize: 15),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 14,
        ),
        floatingLabelStyle: TextStyle(
          color: primary(context),
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        labelText: 'Enter Email',
        contentPadding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primary(context),
            width: 1.3,
          ),
        ),
      ),
    );
  }
}
