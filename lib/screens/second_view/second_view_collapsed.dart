import 'package:cred/utils/colors.dart';
import 'package:cred/utils/extenstions.dart';
import 'package:flutter/material.dart';

class SecondViewCollapsed extends StatelessWidget {
  const SecondViewCollapsed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "EMI",
                style: context.theme.textTheme.labelMedium,
              ),
              const SizedBox(height: 8),
              Text(
                "₹4,247 /mo",
                style: context.theme.textTheme.bodyMedium,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "duration",
                style: context.theme.textTheme.labelMedium,
              ),
              const SizedBox(height: 8),
              Text(
                "12 months",
                style: context.theme.textTheme.bodyMedium,
              ),
            ],
          ),
          const Icon(
            Icons.arrow_drop_down_outlined,
            color: AppColors.textColor,
          ),
        ],
      ),
    );
  }
}
