import 'package:enhanzer/utils/colors.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final IconData icon;
  final IconData? suffixIcon;
  final bool obscureText;
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.icon,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: grey,
            width: 1,
          ),
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: grey,
          fontSize: 15,
        ),
        filled: true,
        fillColor: Colors.grey[200],
        prefixIcon: Icon(
          icon,
          color:grey,
        ),
        suffixIcon: Icon(
          suffixIcon,
          color: grey,
        ),
        hintStyle: TextStyle(
          color: grey,
          fontSize: 14,
        ),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: grey,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color:blue,
            width: 2,
          ),
        ),
      ),
    );
  }
}
