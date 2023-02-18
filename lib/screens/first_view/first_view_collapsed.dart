import 'package:cred/utils/colors.dart';
import 'package:cred/utils/extenstions.dart';
import 'package:flutter/material.dart';

class FirstViewCollapsed extends StatefulWidget {
  const FirstViewCollapsed({
    super.key,
  });

  @override
  State<FirstViewCollapsed> createState() => _FirstViewCollapsedState();
}

class _FirstViewCollapsedState extends State<FirstViewCollapsed> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "credit amount",
                    style: context.theme.textTheme.labelMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "₹1,50,000",
                    style: context.theme.textTheme.bodyMedium,
                  ),
                ],
              ),
              const Icon(
                Icons.keyboard_arrow_down_outlined,
                color: AppColors.textColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
