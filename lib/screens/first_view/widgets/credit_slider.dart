import 'package:cred/models/cred_cash.dart';
import 'package:cred/utils/bloc/cred_cash_bloc.dart';
import 'package:cred/utils/colors.dart';
import 'package:cred/utils/extenstions.dart';
import 'package:cred/widgets/circular_slider/appearance.dart';
import 'package:cred/widgets/circular_slider/circular_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreditSlider extends StatelessWidget {
  const CreditSlider({super.key});

  @override
  Widget build(BuildContext context) {
    const double initialValue = 35;
    const double multiplier = 4300;
    String? selectedAmount = (initialValue * multiplier).ceil().formatNumber();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<CredCashBloc>()
          .add(UpdateCredit(CredCash(creditAmount: selectedAmount)));
    });
    return Container(
      height: 400,
      padding: const EdgeInsets.all(40),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      child: SleekCircularSlider(
        initialValue: initialValue,
        appearance: CircularSliderAppearance(
          angleRange: 360.0,
          startAngle: 270.0,
          customColors: CustomSliderColors(
            progressBarColor: AppColors.progressBarColor,
            trackColor: AppColors.trackColor,
            shadowColor: AppColors.trackColor,
            dotColor: AppColors.backgroundShade1,
            dotRadiusColor: AppColors.progressBarDotRadiusColor,
          ),
          customWidths: CustomSliderWidths(
            trackWidth: 18,
            progressBarWidth: 18,
            handlerSize: 14,
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
                (percentage * multiplier).ceil().formatNumber(),
                style: context.theme.textTheme.bodyLarge?.copyWith(
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                "@1.04% monthly",
                style: context.theme.textTheme.labelSmall?.copyWith(
                  color: AppColors.greenColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          );
        },
        onChange: (percentage) {
          selectedAmount = (percentage * multiplier).ceil().formatNumber();
          context
              .read<CredCashBloc>()
              .add(UpdateCredit(CredCash(creditAmount: selectedAmount)));
          HapticFeedback.mediumImpact();
        },
      ),
    );
  }
}
