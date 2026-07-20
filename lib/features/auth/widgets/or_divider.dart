import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider()),
        Gap(12),

        Text('atau'),

        Gap(12),
        Expanded(child: Divider()),
      ],
    );
  }
}
