import 'package:cred/route/stack_page_route.dart';
import 'package:cred/screens/first_view/first_view_expanded.dart';
import 'package:cred/utils/app_bar.dart';
import 'package:cred/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:neopop/neopop.dart';

class SelectCredit extends StatefulWidget {
  const SelectCredit({super.key});

  @override
  State<SelectCredit> createState() => _SelectCreditState();
}

class _SelectCreditState extends State<SelectCredit> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarBackground,
      appBar: const MyAppBar(),
      body: Center(
        child: NeoPopTiltedButton(
          isFloating: true,
          onTapUp: () {
            Navigator.push(
              context,
              StackPagesRoute(
                previousPages: [
                  const SelectCredit(),
                ],
                newPage: const FirstViewExpanded(),
              ),
            );
          },
          decoration: const NeoPopTiltedButtonDecoration(
            color: Color.fromRGBO(255, 235, 52, 1),
            plunkColor: Color.fromRGBO(255, 235, 52, 1),
            shadowColor: Color.fromRGBO(36, 36, 36, 1),
            showShimmer: true,
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 70.0,
              vertical: 15,
            ),
            child: Text('CRED cash'),
          ),
        ),
      ),
    );
  }
}
