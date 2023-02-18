import 'package:cred/utils/colors.dart';
import 'package:cred/widgets/rounded.dart';
import 'package:flutter/material.dart';

/// Custom stack implementation
class CustomStack extends StatelessWidget {
  final Widget child;
  final double pageSizeProportion;

  const CustomStack({
    super.key,
    required this.pageSizeProportion,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: GestureDetector(
            onTap: () => popFromStack(context),
            child: Container(
              width: double.infinity,
              height: screenSize.height * (4 - pageSizeProportion),
              color: Colors.transparent,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Rounded(
            width: screenSize.width,
            height: screenSize.height * pageSizeProportion,
            backgroundColor: AppColors.backgroundShade1,
            child: child,
          ),
        ),
      ],
    );
  }

  popFromStack(BuildContext context) {
    if (Navigator.of(context).canPop()) Navigator.of(context).pop();
  }
}
