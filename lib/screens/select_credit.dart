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

class SelectCredit extends StatefulWidget {
  const SelectCredit({super.key});

  @override
  State<SelectCredit> createState() => _SelectCreditState();
}

class _SelectCreditState extends State<SelectCredit> {
  ExpandableController firstViewController = ExpandableController(
    initialExpanded: true,
  );

  ExpandableController secondViewController = ExpandableController(
    initialExpanded: true,
  );

  ExpandableController thirdViewController = ExpandableController(
    initialExpanded: true,
  );

  @override
  void initState() {
    super.initState();

    firstViewController.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {});
      });
    });

    secondViewController.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!firstViewController.expanded && !secondViewController.expanded) {
      thirdViewController.expanded = true;
    } else if (!firstViewController.expanded) {
      secondViewController.expanded = true;
      thirdViewController.expanded = false;
    }

    print("firstView.expanded: ${firstViewController.expanded}");
    print("secondView.expanded: ${secondViewController.expanded}");
    print("thirdView.expanded: ${thirdViewController.expanded}");
    return Scaffold(
      backgroundColor: AppColors.appBarBackground,
      appBar: const MyAppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ExpandableNotifier(
                  controller: firstViewController,
                  child: Expandable(
                    expanded: FirstViewExpanded(
                      controller: firstViewController,
                    ),
                    collapsed: FirstViewCollapsed(
                      controller: firstViewController,
                    ),
                  ),
                ),
                !firstViewController.expanded
                    ? ExpandableNotifier(
                        controller: secondViewController,
                        child: Expandable(
                          expanded: SecondViewExpanded(
                            controller: secondViewController,
                          ),
                          collapsed: SecondViewCollapsed(
                            controller: secondViewController,
                          ),
                        ),
                      )
                    : Container(),
                !firstViewController.expanded && !secondViewController.expanded
                    ? ExpandableNotifier(
                        controller: thirdViewController,
                        child: Expandable(
                          expanded: ThirdViewExpanded(
                            controller: thirdViewController,
                          ),
                          collapsed: ThirdViewCollapsed(
                            controller: thirdViewController,
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
