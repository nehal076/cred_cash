import 'package:cred/utils/colors.dart';
import 'package:flutter/material.dart';

class Styles {
  static final ButtonStyle outlinedButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: AppColors.textColor,
    shape: const StadiumBorder(),
    side: const BorderSide(color: AppColors.textColor),
  );
}
