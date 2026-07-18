import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
  });

  final String label;
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleMedium),

        const Gap(8),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(prefixIcon),
          ),
        ),
      ],
    );
  }
}
