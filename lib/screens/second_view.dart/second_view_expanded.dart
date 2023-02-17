import 'package:cred/utils/colors.dart';
import 'package:cred/widgets/credit_text.dart';
import 'package:cred/widgets/rounded.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class Plan {
  final String perMonth;
  final String totalMonths;
  final Color color;

  Plan(this.perMonth, this.totalMonths, this.color);
}

class SecondViewExpanded extends StatelessWidget {
  const SecondViewExpanded({
    super.key,
    required this.controller,
  });

  final ExpandableController controller;

  @override
  Widget build(BuildContext context) {
    List<Plan> plans = [
      Plan("Rs.4,247", "12", const Color(0xff392F3A)),
      Plan("Rs.5,850", "9", const Color(0xff5B5970)),
      Plan("Rs.8,247", "6", const Color(0xff42556D)),
    ];
    return Rounded(
      backgroundColor: AppColors.backgroundShade2,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CreditText(
                  heading: "how do you wish to repay?",
                  label: "choose one of our recommended plans or make your own",
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: plans.length,
                      itemBuilder: (context, index) {
                        return IntrinsicHeight(
                          child: Container(
                            height: 90,
                            width: 200,
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: plans[index].color,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
