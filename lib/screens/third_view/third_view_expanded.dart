import 'package:cred/utils/app_constants.dart';
import 'package:cred/utils/colors.dart';
import 'package:cred/utils/extenstions.dart';
import 'package:cred/widgets/credit_text.dart';
import 'package:cred/widgets/rounded.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ThirdViewExpanded extends StatelessWidget {
  const ThirdViewExpanded({
    super.key,
    required this.controller,
  });

  final ExpandableController controller;

  @override
  Widget build(BuildContext context) {
    return Rounded(
      backgroundColor: AppColors.backgroundShade3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CreditText(
                  heading: "how do you wish to repay?",
                  label: "choose one of our recommended plans or make your own",
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 40),
                IntrinsicWidth(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(width: 1, color: AppColors.textColor),
                    ),
                    child: Text(
                      "Create your own plan",
                      style: context.theme.textTheme.labelMedium?.copyWith(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
                controller.toggle();
              },
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
                  'Proceed to EMI selection',
                  style: context.theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.onButtonColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
