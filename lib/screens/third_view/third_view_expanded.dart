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
                  heading: "where should we send the money?",
                  label:
                      "amount will be credited to this bank account, EMI will also be debited from this bank account",
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/images/paytm_logo.png',
                        height: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Paytm Payments Bank',
                            style: context.theme.textTheme.bodyMedium
                                ?.copyWith(color: Colors.white),
                          ),
                          Text(
                            '919950693543',
                            style: context.theme.textTheme.displayMedium,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.checkboxBackground,
                      ),
                    ),
                  ],
                ),
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
                      "Change account",
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
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: InkWell(
          //     onTap: () {
          //       controller.toggle();
          //     },
          //     child: Container(
          //       height: 90,
          //       alignment: Alignment.center,
          //       decoration: const BoxDecoration(
          //         color: AppColors.buttonColor,
          //         borderRadius: BorderRadius.only(
          //           topLeft: Radius.circular(radius),
          //           topRight: Radius.circular(radius),
          //         ),
          //       ),
          //       child: Text(
          //         'Tap for 1-click KYC',
          //         style: context.theme.textTheme.bodyMedium?.copyWith(
          //           color: AppColors.onButtonColor,
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
