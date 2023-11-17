import 'package:flutter/material.dart';

class PrivacyPolicyWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const PrivacyPolicyWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: const Center(
          child: Text(
            'Política de Privacidade',
            style: TextStyle(
                fontSize: 17, color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ));
  }
}
