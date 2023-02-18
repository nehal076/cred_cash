import 'package:cred/utils/app_constants.dart';
import 'package:cred/utils/colors.dart';
import 'package:cred/utils/extenstions.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 90,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius),
              topRight: Radius.circular(radius),
            ),
          ),
          child: Text(
            text,
            style: context.theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.onButtonColor,
            ),
          ),
        ),
      ),
    );
  }
}