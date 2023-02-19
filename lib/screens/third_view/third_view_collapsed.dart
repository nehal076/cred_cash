import 'package:cred/utils/colors.dart';
import 'package:cred/utils/extenstions.dart';
import 'package:flutter/material.dart';

class ThirdViewCollapsed extends StatelessWidget {
  const ThirdViewCollapsed({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
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
                "Rs. 1,50,000",
                style: context.theme.textTheme.bodyMedium,
              ),
            ],
          ),
          const Icon(
            Icons.arrow_drop_down_outlined,
            color: AppColors.textColor,
          )
        ],
      ),
    );
  }
}
