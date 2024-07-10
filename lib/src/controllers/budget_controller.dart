import 'package:budget_tracker/src/models/transaction_model.dart';
import 'package:budget_tracker/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';

class BudgetController extends GetxController {
  var transactions = <Transaction>[].obs;
  var selectedDate = DateTime.now().obs;
  var showAll = true.obs;

  @override
  void onInit() async {
    getTransactions();
    super.onInit();
  }

  void getTransactions() {
    //TODO getTransactions
  }

  void addTransaction(Transaction item) {
    transactions.add(item);
  }

  Color getBorderColor(String transactionType) {
    if (transactionType == 'income') {
      return lightBlue;
    }
    return lightOrange;
  }

  Widget getCalendar() {
    return HorizontalCalendar(
      initialDate: DateTime.now().subtract(const Duration(days: 90)),
      lastDate: DateTime.now(),
      date: DateTime.now(),
      locale: const Locale('ru', 'RU'),
      textColor: Colors.black45,
      selectedColor: primary.withOpacity(.7),
      onDateSelected: (date) {
        if ((date as DateTime).isAfter(DateTime.now())) return;
        //TODO filter by date
      },
    );
  }
}
