import 'package:cred/screens/first_view/first_view_expanded.dart';
import 'package:cred/screens/second_view/second_view_expanded.dart';
import 'package:cred/utils/app_bar.dart';
import 'package:cred/utils/colors.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';

class SelectCredit extends StatefulWidget {
  const SelectCredit({super.key});

  @override
  State<SelectCredit> createState() => _SelectCreditState();
}

class _SelectCreditState extends State<SelectCredit> {
  ExpandableController firstView = ExpandableController(
    initialExpanded: true,
  );

  ExpandableController secondView = ExpandableController(
    initialExpanded: false,
  );

  ExpandableController thirdView = ExpandableController(
    initialExpanded: false,
  );

  @override
  void initState() {
    super.initState();

    firstView.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {});
      });
    });

    secondView.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // if (!firstView.expanded && secondView.expanded) {
    //   thirdView.expanded = true;
    // } else if (!firstView.expanded &&
    //     !secondView.expanded &&
    //     !thirdView.expanded) {
    //   secondView.expanded = true;
    // }
    return Scaffold(
      backgroundColor: AppColors.appBarBackground,
      appBar: const MyAppBar(),
      body: Center(
        child: NeoPopTiltedButton(
          isFloating: true,
          onTapUp: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return const FractionallySizedBox(
                  heightFactor: 0.8,
                  child: FirstViewExpanded(),
                );
              },
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
            child: Text('Play Now'),
          ),
        ),
      ),
    );
  }

  getButtonText() {
    if (firstView.expanded == true) {
      return 'Proceed to EMI selection';
    }
    if (secondView.expanded == true) {
      return 'Select your bank account';
    }

    if (thirdView.expanded == true) {
      return 'Tap for 1-click KYC';
    }
  }

  onButtonTap() {
    if (firstView.expanded == true) {
      // firstView.toggle();
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return const SecondViewExpanded();
        },
      );
    } else if (secondView.expanded == true) {
      secondView.toggle();
    } else if (thirdView.expanded == true) {
      thirdView.toggle();
    }
  }

  getBackground() {
    if (firstView.expanded == true) {
      return AppColors.backgroundShade1;
    }
    if (secondView.expanded == true) {
      return AppColors.backgroundShade2;
    }

    if (thirdView.expanded == true) {
      return AppColors.backgroundShade3;
    }
  }
}
