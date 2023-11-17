import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    Key? key,
    required this.controller,
    required this.icon,
    required this.validator,
    this.obscureText = false,
  }) : super(key: key);

  final TextEditingController controller;
  final IconData icon;
  final String? Function(String?)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        controller: controller,
        autofocus: true,
        obscureText: obscureText,
        validator: validator,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          errorStyle: const TextStyle(color: Colors.white),
          fillColor: Colors.white,
          filled: true,
          icon: Icon(icon, color: Colors.white),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius:
                BorderRadius.circular(10.0), // Adjust the radius as needed
          ),
          hintStyle: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
