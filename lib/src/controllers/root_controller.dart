import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:budget_tracker/src/utils/colors.dart';
import 'package:budget_tracker/src/view/budget_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RootController extends GetxController {
  static const List<Widget> views = [
    BudgetView(),
    BudgetView(),
    BudgetView(),
    BudgetView(),
  ];

  var pageIndex = 0.obs;

  Widget getBody() {
    return IndexedStack(
      index: pageIndex.value,
      children: views,
    );
  }

  Widget getFooter() {
    final List<IconData> iconItems = [
      MdiIcons.calendar,
      MdiIcons.chartBellCurveCumulative,
      MdiIcons.walletOutline,
      MdiIcons.account,
    ];

    return AnimatedBottomNavigationBar(
      activeColor: primary,
      splashColor: secondary,
      inactiveColor: iconBlack,
      icons: iconItems,
      activeIndex: pageIndex.value,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 25,
      rightCornerRadius: 10,
      onTap: (index) {
        selectTab(index);
      },
    );
  }

  void selectTab(int index) {
    pageIndex.value = index;
  }
}
