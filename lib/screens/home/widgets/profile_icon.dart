import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    const overlap = 50.0;
    final items = [
      Circle(child: Image.asset('assets/images/profile_image.png')),
      Circle(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset('assets/images/cred_cash.png'),
      )),
    ];

    List<Widget> stackLayers = List<Widget>.generate(items.length, (index) {
      return Padding(
        padding: EdgeInsets.fromLTRB(index.toDouble() * overlap, 0, 0, 0),
        child: items[index],
      );
    });

    return Stack(children: stackLayers);
  }
}

class Circle extends StatelessWidget {
  final Widget child;
  const Circle({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient:
            LinearGradient(colors: [Color(0xff333535), Color(0xff1E2225)]),
      ),
      height: 70,
      child: child,
    );
  }
}
