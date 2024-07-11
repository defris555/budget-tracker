import 'package:budget_tracker/src/models/transaction_model.dart';
import 'package:budget_tracker/src/utils/colors.dart';
import 'package:budget_tracker/src/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants.dart';

class BudgetController extends GetxController {
  var transactions = <Transaction>[].obs;
  var transactionsByDate = <Transaction>[].obs;
  var selectedDate = DateTime.now().dateOnly();
  var spending = <String, double>{}.obs;
  var showAll = false.obs;

  @override
  void onInit() async {
    super.onInit();
    getTransactions();
    getSpending();
  }

  void getTransactions() {
    final Map<String, dynamic> map = box.read('transactions') ?? {};
    map.forEach((key, value) => transactions.add(Transaction.fromMap(value)));
    sortByDate();
  }

  void sortByDate() {
    transactionsByDate = transactions
        .where((el) => el.date.dateOnly() == selectedDate)
        .toList()
        .obs;
  }

  void setDate(DateTime date) {
    selectedDate = (date).dateOnly();
  }

  void addTransaction(Transaction item) {
    transactions.add(item);
    final Map<String, dynamic> map = box.read('transactions') ?? {};
    map[item.id] = item.toMap();
    box.write('transactions', map);
    setDate(DateTime.now());
    sortByDate();
    if (item.type == 'expenses') {
      spending.update(
        item.category,
        (value) => value + item.price,
        ifAbsent: () => item.price,
      );
    }
    update();
  }

  void editTransaction(Transaction item) {
    //TODO edit
  }

  void deleteTransaction(String id) {
    //TODO delete
  }

  void getSpending() {
    for (var item in transactions) {
      if (item.type == 'income') continue;
      spending.update(
        item.category,
        (value) => value + item.price,
        ifAbsent: () => item.price,
      );
    }
  }

  Color getCategoryColor(String value) {
    switch (value) {
      case 'food':
        return lightGreen;
      case 'cloth':
        return lightBlue;
      case 'entertainment':
        return lightOrange;
      case 'transportation':
        return lightViolet;
      case 'personal':
        return lightYellow;
      default:
        return lightSea;
    }
  }

  String getCategoryName(String value) {
    switch (value) {
      case 'food':
        return 'Еда';
      case 'cloth':
        return 'Одежда';
      case 'entertainment':
        return 'Развлечения';
      case 'transportation':
        return 'Транспорт';
      case 'personal':
        return 'Личное';
      default:
        return 'Другое';
    }
  }
}
