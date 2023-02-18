import 'package:cred/route/custom_stack.dart';
import 'package:cred/route/stack_page_route.dart';
import 'package:cred/screens/first_view/first_view_expanded.dart';
import 'package:cred/screens/second_view/second_view_collapsed.dart';
import 'package:cred/screens/select_credit.dart';
import 'package:cred/screens/third_view/third_view_expanded.dart';
import 'package:cred/utils/colors.dart';
import 'package:cred/utils/extenstions.dart';
import 'package:cred/widgets/bottom_button.dart';
import 'package:cred/widgets/credit_text.dart';
import 'package:flutter/material.dart';

class SecondViewExpanded extends StatelessWidget {
  const SecondViewExpanded({
    super.key,
    this.collapse,
  });
  final bool? collapse;

  @override
  Widget build(BuildContext context) {
    List<Plan> plans = [
      Plan("Rs.4,247", "12", const Color(0xff392F3A)),
      Plan("Rs.5,850", "9", const Color(0xff5B5970)),
      Plan("Rs.8,247", "6", const Color(0xff42556D)),
    ];
    return CustomStack(
      pageSizeProportion: 0.73,
      backgroundColor: AppColors.backgroundShade2,
      child: collapse == true
          ? const SecondViewCollapsed()
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CreditText(
                        heading: "how do you wish to repay?",
                        label:
                            "choose one of our recommended plans or make your own",
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 240,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: plans.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 200,
                              padding: const EdgeInsets.all(30),
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: plans[index].color,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 1,
                                        color: AppColors.borderColor
                                            .withOpacity(0.4),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        const TextSpan(text: '₹4,247'),
                                        TextSpan(
                                          text: ' /mo',
                                          style: context
                                              .theme.textTheme.labelMedium
                                              ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.textColor
                                                .withOpacity(0.6),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'for 12 months',
                                    style: context.theme.textTheme.labelSmall,
                                  ),
                                  const SizedBox(height: 40),
                                  Text(
                                    'See calculations',
                                    style: context.theme.textTheme.labelSmall
                                        ?.copyWith(
                                      decorationColor: AppColors.textColor,
                                      decoration: TextDecoration.underline,
                                      decorationStyle:
                                          TextDecorationStyle.dotted,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 40),
                      IntrinsicWidth(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                                width: 1, color: AppColors.textColor),
                          ),
                          child: Text(
                            "Create your own plan",
                            style:
                                context.theme.textTheme.labelMedium?.copyWith(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
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
                          const SecondViewExpanded(collapse: true),
                        ],
                        newPage: const ThirdViewExpanded(),
                      ),
                    );
                  },
                  text: 'Select a bank account',
                ),
              ],
            ),
    );
  }
}

class Plan {
  final String perMonth;
  final String totalMonths;
  final Color color;

  Plan(this.perMonth, this.totalMonths, this.color);
}
