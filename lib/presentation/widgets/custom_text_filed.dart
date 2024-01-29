import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.onChanged,
  });
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 3,
            ),
          ),
          border: const OutlineInputBorder(),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
