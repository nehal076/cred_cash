import 'package:cred/utils/bloc/cred_cash_bloc.dart';
import 'package:cred/utils/colors.dart';
import 'package:cred/utils/extenstions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondViewCollapsed extends StatefulWidget {
  const SecondViewCollapsed({super.key});

  @override
  State<SecondViewCollapsed> createState() => _SecondViewCollapsedState();
}

class _SecondViewCollapsedState extends State<SecondViewCollapsed> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "EMI",
                style: context.theme.textTheme.labelMedium,
              ),
              const SizedBox(height: 8),
              Text(
                "${context.read<CredCashBloc>().credCash.emiAmount} /mo",
                style: context.theme.textTheme.bodyMedium,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "duration",
                style: context.theme.textTheme.labelMedium,
              ),
              const SizedBox(height: 8),
              Text(
                "${context.read<CredCashBloc>().credCash.duration} months",
                style: context.theme.textTheme.bodyMedium,
              ),
            ],
          ),
          const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: AppColors.textColor,
          ),
        ],
      ),
    );
  }
}
