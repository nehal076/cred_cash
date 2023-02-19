import 'package:cred/utils/extenstions.dart';
import 'package:flutter/material.dart';

class CreditText extends StatelessWidget {
  final String heading;
  final String label;
  const CreditText({super.key, required this.heading, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: context.theme.textTheme.bodyLarge,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: context.theme.textTheme.labelMedium,
        ),
      ],
    );
  }
}
