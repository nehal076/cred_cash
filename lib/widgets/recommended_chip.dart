import 'package:cred/utils/colors.dart';
import 'package:cred/utils/extenstions.dart';
import 'package:flutter/material.dart';

class RecommendedChip extends StatelessWidget {
  const RecommendedChip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 28,
          width: 130,
          decoration: BoxDecoration(
            color: AppColors.chipColor,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 8,
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            "recommended",
            style: context.theme.textTheme.labelSmall?.copyWith(
              fontSize: 12,
              color: AppColors.chipTextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
