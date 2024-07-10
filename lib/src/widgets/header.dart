import 'package:budget_tracker/src/controllers/budget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';

class Header extends GetView<BudgetController> {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Column(
        children: [
          controller.getCalendar(),
        ],
      ),
    );
  }
}
