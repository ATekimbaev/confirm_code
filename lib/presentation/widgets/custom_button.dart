import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
  });
  final Function()? onPressed;
  final Widget text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: Colors.black45,
          backgroundColor: Colors.red,
        ),
        onPressed: onPressed,
        child: text
      ),
    );
  }
}
