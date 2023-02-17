import 'package:flutter/material.dart';

class Rounded extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;
  const Rounded({
    super.key,
    required this.backgroundColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    const double radius = 30;
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
        ),
      ),
      child: child,
    );
  }
}
