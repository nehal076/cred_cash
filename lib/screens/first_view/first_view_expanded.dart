import 'package:cred/route/custom_stack.dart';
import 'package:cred/route/stack_page_route.dart';
import 'package:cred/screens/first_view/first_view_collapsed.dart';
import 'package:cred/screens/second_view/second_view_expanded.dart';
import 'package:cred/screens/select_credit.dart';
import 'package:cred/utils/colors.dart';
import 'package:cred/utils/extenstions.dart';
import 'package:cred/widgets/bottom_button.dart';
import 'package:cred/widgets/circular_slider/appearance.dart';
import 'package:cred/widgets/circular_slider/circular_slider.dart';
import 'package:cred/widgets/credit_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FirstViewExpanded extends StatelessWidget {
  const FirstViewExpanded({
    super.key,
    this.collapse,
  });

  final bool? collapse;

  @override
  Widget build(BuildContext context) {
    return CustomStack(
      pageSizeProportion: 0.85,
      backgroundColor: AppColors.backgroundShade1,
      child: collapse == true
          ? const FirstViewCollapsed()
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const CreditText(
                        heading: "nehal, how much do you need?",
                        label:
                            "move the dial and set any amount you need upto Rs. 487,891",
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 400,
                        padding: const EdgeInsets.all(40),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                        ),
                        child: SleekCircularSlider(
                          initialValue: 35,
                          appearance: CircularSliderAppearance(
                            angleRange: 360.0,
                            startAngle: 270.0,
                            customColors: CustomSliderColors(
                              progressBarColor: AppColors.progressBarColor,
                              trackColor: AppColors.trackColor,
                              shadowColor: AppColors.trackColor,
                              dotColor: AppColors.backgroundShade1,
                              dotRadiusColor:
                                  AppColors.progressBarDotRadiusColor,
                            ),
                            customWidths: CustomSliderWidths(
                              trackWidth: 18,
                              progressBarWidth: 18,
                              handlerSize: 12,
                            ),
                          ),
                          innerWidget: (percentage) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "credit amount",
                                  style: context.theme.textTheme.labelSmall,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  (percentage * 4300).ceil().formatNumber(),
                                  style: context.theme.textTheme.bodyLarge
                                      ?.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  "@1.04% monthly",
                                  style: context.theme.textTheme.labelSmall
                                      ?.copyWith(
                                    color: AppColors.greenColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            );
                          },
                          onChange: (_) {
                            HapticFeedback.mediumImpact();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                BottomButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      StackPagesRoute(
                        previousPages: [
                          const SelectCredit(),
                          const FirstViewExpanded(collapse: true),
                        ],
                        newPage: const SecondViewExpanded(),
                      ),
                    );
                  },
                  text: 'Proceed to EMI selection',
                ),
              ],
            ),
    );
  }
}
