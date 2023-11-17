import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.onPressed, required this.child})
      : super(key: key);

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF44bd6e),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .2, vertical: size.height * .018),
        ),
        child: child,
      ),
    );
  }
}
