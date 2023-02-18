import 'package:cred/screens/first_view/first_view_collapsed.dart';
import 'package:cred/screens/first_view/first_view_expanded.dart';
import 'package:cred/screens/second_view/second_view_collapsed.dart';
import 'package:cred/screens/second_view/second_view_expanded.dart';
import 'package:cred/screens/third_view/third_view_collapsed.dart';
import 'package:cred/screens/third_view/third_view_expanded.dart';
import 'package:cred/utils/app_bar.dart';
import 'package:cred/utils/app_constants.dart';
import 'package:cred/utils/colors.dart';
import 'package:cred/utils/extenstions.dart';
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
    if (!firstView.expanded && secondView.expanded) {
      thirdView.expanded = true;
    } else if (!firstView.expanded &&
        !secondView.expanded &&
        !thirdView.expanded) {
      secondView.expanded = true;
    }
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
                  return FractionallySizedBox(
                    heightFactor: 0.8,
                    child: FirstViewExpanded(controller: firstView),
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
        )

        // Stack(
        //   children: [
        //     SingleChildScrollView(
        //       child: Column(
        //         mainAxisSize: MainAxisSize.max,
        //         children: [
        //           ExpandableNotifier(
        //             controller: firstView,
        //             child: Expandable(
        //               expanded: FirstViewExpanded(
        //                 controller: firstView,
        //               ),
        //               collapsed: FirstViewCollapsed(
        //                 controller: firstView,
        //               ),
        //             ),
        //           ),
        //           !firstView.expanded
        //               ? ExpandableNotifier(
        //                   controller: secondView,
        //                   child: Expandable(
        //                     expanded: SecondViewExpanded(
        //                       controller: secondView,
        //                     ),
        //                     collapsed: SecondViewCollapsed(
        //                       controller: secondView,
        //                     ),
        //                   ),
        //                 )
        //               : Container(),
        //           !firstView.expanded && !secondView.expanded
        //               ? ExpandableNotifier(
        //                   controller: thirdView,
        //                   child: Expandable(
        //                     expanded: ThirdViewExpanded(
        //                       controller: thirdView,
        //                     ),
        //                     collapsed: ThirdViewCollapsed(
        //                       controller: thirdView,
        //                     ),
        //                   ),
        //                 )
        //               : Container(),
        //         ],
        //       ),
        //     ),
        //     Align(
        //       alignment: Alignment.bottomCenter,
        //       child: InkWell(
        //         onTap: onButtonTap,
        //         child: Container(
        //           height: 90,
        //           alignment: Alignment.center,
        //           decoration: const BoxDecoration(
        //             color: AppColors.buttonColor,
        //             borderRadius: BorderRadius.only(
        //               topLeft: Radius.circular(radius),
        //               topRight: Radius.circular(radius),
        //             ),
        //           ),
        //           child: Text(
        //             getButtonText(),
        //             style: context.theme.textTheme.bodyMedium?.copyWith(
        //               color: AppColors.onButtonColor,
        //             ),
        //           ),
        //         ),
        //       ),
        //     )
        //   ],
        // ),
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
