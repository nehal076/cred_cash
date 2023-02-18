import 'package:cred/utils/app_bar.dart';
import 'package:cred/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarBackground,
      appBar: const MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('congratulations!, you\'ve received CRED cash'),
            Lottie.asset(
              'assets/animations/gift_anim.json',
              height: 400,
              repeat: true,
              reverse: true,
            )
          ],
        ),
      ),
    );
  }
}
