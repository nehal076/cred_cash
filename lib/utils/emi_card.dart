import 'package:cred/models/cred_cash.dart';
import 'package:cred/utils/bloc/cred_cash_bloc.dart';
import 'package:cred/utils/colors.dart';
import 'package:cred/utils/extenstions.dart';
import 'package:cred/widgets/recommended_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmiCard extends StatelessWidget {
  const EmiCard({
    super.key,
    required this.plan,
  });

  final Plan plan;

  @override
  Widget build(BuildContext context) {
    if (plan.isSelected == true) {
      CredCashBloc credCashBloc = context.read<CredCashBloc>();
      CredCash credCash = credCashBloc.credCash;

      credCash.emiAmount = plan.perMonth;
      credCash.duration = plan.totalMonths;

      credCashBloc.add(UpdateCredit(credCash));
    }

    return Stack(
      children: [
        Container(
          width: 200,
          padding: const EdgeInsets.all(30),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: plan.color,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1,
                    color: AppColors.borderColor.withOpacity(0.4),
                  ),
                ),
                child: plan.isSelected == true
                    ? const Icon(
                        Icons.check,
                        color: AppColors.trackColor,
                      )
                    : null,
              ),
              const SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: plan.perMonth),
                    TextSpan(
                      text: ' /mo',
                      style: context.theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'for ${plan.totalMonths} months',
                style: context.theme.textTheme.labelSmall,
              ),
              const SizedBox(height: 40),
              Text(
                'See calculations',
                style: context.theme.textTheme.labelSmall?.copyWith(
                  decorationColor: AppColors.textColor,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dotted,
                ),
              ),
            ],
          ),
        ),
        plan.recommended == true
            ? const RecommendedChip()
            : const SizedBox.shrink(),
      ],
    );
  }
}

class Plan {
  final String perMonth;
  final String totalMonths;
  final Color color;
  final bool? recommended;
  bool? isSelected;

  Plan(
    this.perMonth,
    this.totalMonths,
    this.color, {
    this.recommended,
    this.isSelected,
  });
}
