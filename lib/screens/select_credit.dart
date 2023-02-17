import 'package:cred/screens/first_view.dart/first_view_collapsed.dart';
import 'package:cred/screens/first_view.dart/first_view_expanded.dart';
import 'package:cred/screens/second_view.dart/second_view_collapsed.dart';
import 'package:cred/screens/second_view.dart/second_view_expanded.dart';
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

  @override
  void initState() {
    super.initState();

    firstViewController.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    secondViewController.expanded = !firstViewController.expanded;
    print("firstView.expanded: ${firstViewController.expanded}");
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
                firstViewController.expanded == false
                    ? Positioned(
                        child: Column(
                          children: [
                            ExpandableNotifier(
                              controller: secondViewController,
                              child: Expandable(
                                expanded: SecondViewExpanded(
                                  controller: secondViewController,
                                ),
                                collapsed: SecondViewCollapsed(
                                  controller: secondViewController,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
                firstViewController.toggle();
              },
              child: Container(
                height: 90,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.buttonColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(radius),
                    topRight: Radius.circular(radius),
                  ),
                ),
                child: Text(
                  'Proceed to EMI selection',
                  style: context.theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.onButtonColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
