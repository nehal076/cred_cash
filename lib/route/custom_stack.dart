import 'package:cred/utils/colors.dart';
import 'package:cred/widgets/rounded.dart';
import 'package:flutter/material.dart';

class CustomStack extends StatelessWidget {
  final Widget child;
  final double pageSizeProportion;
  final Color backgroundColor;

  const CustomStack({
    super.key,
    required this.pageSizeProportion,
    required this.child,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: GestureDetector(
            onTap: () => popFromStack(context),
            child: Container(
              width: double.infinity,
              height: size.height * (pageSizeProportion),
              color: Colors.transparent,
            ),
          ),
        ),
        GestureDetector(
          onVerticalDragUpdate: (details) {
            int sensitivity = 8;
            // Closing View on Swipe Down
            if (details.delta.dy > sensitivity) {
              popFromStack(context);
            }
          },
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Rounded(
              width: size.width,
              height: size.height * pageSizeProportion,
              backgroundColor: AppColors.backgroundShade1,
              child: Scaffold(
                backgroundColor: backgroundColor,
                body: child,
              ),
            ),
          ),
        ),
      ],
    );
  }

  popFromStack(BuildContext context) {
    if (Navigator.of(context).canPop()) Navigator.of(context).pop();
  }
}
