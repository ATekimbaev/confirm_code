import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.onChanged,
  });
  final String hintText;
  final TextEditingController controller;
  bool obscureText;
  final Function(String)? onChanged;
  

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}


class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5, bottom: 2),
            child: Text(
              widget.hintText,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
          TextField(
            onChanged: widget.onChanged,
            obscureText: false,
            controller: widget.controller,
            decoration: InputDecoration(
                focusColor: Colors.black,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                    width: 1,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                    width: 3,
                  ),
                ),
                border: const OutlineInputBorder(),
                hintText: getHinText(widget.hintText),
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                ),
                suffixIcon: widget.obscureText
                    ? IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        onPressed: () {
                          setState(() {
                          });
                        },
                      )
                    : SizedBox()),
          ),
        ],
      ),
    );
  }

  String getHinText(String hintText) {
    switch (hintText.toLowerCase()) {
      case "email":
        return "example@gmail.com";

      case "login":
        return "Your login";
      case "password":
        return "must be letters and numbers";
      case "confirm password":
        return "repeat password";
      default:
        return "Enter";
    }
  }
}
