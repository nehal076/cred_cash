import 'package:cred/route/custom_stack.dart';
import 'package:cred/screens/success_screen.dart';
import 'package:cred/utils/colors.dart';
import 'package:cred/utils/extenstions.dart';
import 'package:cred/widgets/bottom_button.dart';
import 'package:cred/widgets/credit_text.dart';
import 'package:flutter/material.dart';

class ThirdViewExpanded extends StatefulWidget {
  const ThirdViewExpanded({
    super.key,
  });

  @override
  State<ThirdViewExpanded> createState() => _ThirdViewExpandedState();
}

class _ThirdViewExpandedState extends State<ThirdViewExpanded> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return CustomStack(
      pageSizeProportion: 0.62,
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = !selected;
                    });
                  },
                  child: Row(
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
                                  ?.copyWith(color: Colors.white, fontSize: 16),
                            ),
                            Text(
                              '919950693543',
                              style: context.theme.textTheme.displayMedium
                                  ?.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.checkboxBackground,
                        ),
                        child: selected == true
                            ? const Icon(
                                Icons.check,
                                color: AppColors.trackColor,
                              )
                            : null,
                      ),
                    ],
                  ),
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
          BottomButton(
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SuccessScreen();
              }));
            },
            text: 'Tap for 1-click KYC',
          ),
        ],
      ),
    );
  }
}
