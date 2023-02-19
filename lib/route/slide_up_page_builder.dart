import 'package:flutter/material.dart';

class SlideUpRoute extends PageRouteBuilder {
  final List<Widget> oldScreens;
  final Widget nextScreen;

  SlideUpRoute({
    required this.oldScreens,
    required this.nextScreen,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              nextScreen,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return Stack(
              children: [
                ...oldScreens,
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: Offset.zero,
                  ).animate(animation),
                  child: nextScreen,
                ),
              ],
            );
          },
        );
}
