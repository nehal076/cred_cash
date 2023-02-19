import 'package:cred/route/custom_stack.dart';
import 'package:cred/route/stack_page_route.dart';
import 'package:cred/screens/first_view/first_view_expanded.dart';
import 'package:cred/screens/second_view/second_view_collapsed.dart';
import 'package:cred/screens/select_credit.dart';
import 'package:cred/screens/third_view/third_view_expanded.dart';
import 'package:cred/utils/colors.dart';
import 'package:cred/utils/emi_card.dart';
import 'package:cred/utils/extenstions.dart';
import 'package:cred/widgets/bottom_button.dart';
import 'package:cred/widgets/credit_text.dart';
import 'package:flutter/material.dart';

class SecondViewExpanded extends StatefulWidget {
  const SecondViewExpanded({
    super.key,
    this.collapse,
  });
  final bool? collapse;

  @override
  State<SecondViewExpanded> createState() => _SecondViewExpandedState();
}

class _SecondViewExpandedState extends State<SecondViewExpanded> {
  List<Plan> plans = [
    Plan("Rs.4,247", "12", const Color(0xff392F3A)),
    Plan("Rs.5,850", "9", const Color(0xff5B5970), recommended: true),
    Plan("Rs.8,247", "6", const Color(0xff42556D)),
  ];
  @override
  Widget build(BuildContext context) {
    return CustomStack(
      pageSizeProportion: 0.73,
      backgroundColor: AppColors.backgroundShade2,
      child: widget.collapse == true
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
                            return GestureDetector(
                              onTap: () {
                                for (var plan in plans) {
                                  plan.isSelected = false;
                                }
                                setState(() {
                                  plans[index].isSelected = true;
                                });
                              },
                              child: EmiCard(plan: plans[index]),
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
                          const HomeScreen(),
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
