import 'package:budget_tracker/src/controllers/budget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';

import '../utils/colors.dart';

class Header extends GetView<BudgetController> {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Column(
        children: [
          headerCalendar(),
        ],
      ),
    );
  }

  Widget headerCalendar() {
    return HorizontalCalendar(
      initialDate: DateTime.now().subtract(const Duration(days: 90)),
      date: DateTime.now(),
      locale: const Locale('ru', 'RU'),
      textColor: Colors.black45,
      selectedColor: primary.withOpacity(.7),
      onDateSelected: (date) {
        controller.setDate(date);
        controller.sortByDate();
        controller.update();
      },
    );
  }
}
