import 'package:cred/utils/colors.dart';
import 'package:cred/utils/extenstions.dart';
import 'package:cred/widgets/rounded.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class SecondViewCollapsed extends StatelessWidget {
  const SecondViewCollapsed({
    super.key,
    required this.controller,
  });

  final ExpandableController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.toggle();
      },
      child: Rounded(
        backgroundColor: AppColors.backgroundShade2,
        child: Padding(
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
        ),
      ),
    );
  }
}
