import 'package:cred/route/screens.dart';
import 'package:cred/screens/home/widgets/profile_icon.dart';
import 'package:cred/utils/colors.dart';
import 'package:cred/utils/extenstions.dart';
import 'package:flutter/material.dart';
import 'package:neopop/neopop.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarBackground,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 0,
        leading: Container(),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ProfileIcon(),
              const SizedBox(height: 10),
              const Text('CRED cash'),
              const SizedBox(height: 40),
              const Text('you have'),
              Text(
                487891.formatNumber(),
                style: context.theme.textTheme.bodyLarge?.copyWith(
                  color: AppColors.greenColor,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'withdraw instantly from your personal credit line',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              NeoPopTiltedButton(
                isFloating: true,
                onTapUp: () {
                  Navigator.pushNamed(context, Screens.first_view);
                },
                decoration: const NeoPopTiltedButtonDecoration(
                  color: AppColors.yellowColor,
                  plunkColor: AppColors.yellowColor,
                  shadowColor: AppColors.shadowColor,
                  showShimmer: true,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 70.0, vertical: 15),
                  child: Text(
                    'Take a look',
                    style: context.theme.textTheme.bodyMedium
                        ?.copyWith(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
