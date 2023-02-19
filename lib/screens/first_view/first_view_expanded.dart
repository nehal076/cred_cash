import 'package:cred/route/custom_stack.dart';
import 'package:cred/route/screens.dart';
import 'package:cred/screens/first_view/first_view_collapsed.dart';
import 'package:cred/screens/first_view/widgets/credit_slider.dart';
import 'package:cred/utils/colors.dart';
import 'package:cred/utils/extenstions.dart';
import 'package:cred/widgets/bottom_button.dart';
import 'package:cred/widgets/credit_text.dart';
import 'package:flutter/material.dart';

class FirstViewExpanded extends StatefulWidget {
  const FirstViewExpanded({super.key, this.collapse});

  final bool? collapse;

  @override
  State<FirstViewExpanded> createState() => _FirstViewExpandedState();
}

class _FirstViewExpandedState extends State<FirstViewExpanded> {
  @override
  Widget build(BuildContext context) {
    return CustomStack(
      pageSizeProportion: 0.85,
      backgroundColor: AppColors.backgroundShade1,
      child: widget.collapse == true
          ? const FirstViewCollapsed()
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CreditText(
                        heading: "nehal, how much do you need?",
                        label:
                            "move the dial and set any amount you need upto ${487891.formatNumber()}",
                      ),
                      const SizedBox(height: 20),
                      const CreditSlider()
                    ],
                  ),
                ),
                BottomButton(
                  onTap: () {
                    Navigator.pushNamed(context, Screens.second_view);
                  },
                  text: 'Proceed to EMI selection',
                ),
              ],
            ),
    );
  }
}
