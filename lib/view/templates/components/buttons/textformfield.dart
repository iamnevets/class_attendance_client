import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    Key? key,
    this.hintText,
    this.iconName,
    required this.obscureText,
    required this.initValue,
  }) : super(key: key);

  final String? hintText;
  final Icon? iconName;
  final bool obscureText;
  final String initValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initValue,
      onChanged: (value) {

      },
      obscureText: obscureText,
      decoration: InputDecoration(
          prefixIcon: iconName,
          fillColor: Colors.grey[200],
          filled: false,
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
