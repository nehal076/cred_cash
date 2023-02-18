import 'package:flutter/material.dart';

class Rounded extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;
  final double? width;
  final double? height;
  const Rounded({
    super.key,
    required this.backgroundColor,
    required this.child,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    const double radius = 30;
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.hardEdge,
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
