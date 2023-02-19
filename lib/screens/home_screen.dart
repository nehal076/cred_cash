import 'package:cred/route/stack_page_route.dart';
import 'package:cred/screens/first_view/first_view_expanded.dart';
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
        child: NeoPopTiltedButton(
          isFloating: true,
          onTapUp: () {
            Navigator.push(
              context,
              StackPagesRoute(
                previousPages: [
                  const HomeScreen(),
                ],
                newPage: const FirstViewExpanded(),
              ),
            );
          },
          decoration: const NeoPopTiltedButtonDecoration(
            color: AppColors.yellowColor,
            plunkColor: AppColors.yellowColor,
            shadowColor: AppColors.shadowColor,
            showShimmer: true,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 15),
            child: Text(
              'CRED cash',
              style: context.theme.textTheme.bodyMedium
                  ?.copyWith(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
