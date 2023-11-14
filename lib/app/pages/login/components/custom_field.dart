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
  final Widget icon;
  final String? Function(String?)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: icon,
            ),
            Expanded(
              child: TextFormField(
                controller: controller,
                autofocus: true,
                obscureText: obscureText,
                validator: validator,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
