import 'package:budget_tracker/src/models/transaction_model.dart';
import 'package:budget_tracker/src/repository/budget_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BudgetController extends GetxController {
  var transactions = <Transaction>[].obs;

  @override
  void onInit() async {
    await fetchApi();
    super.onInit();
  }

  Future<void> fetchApi() async {
    final result = await BudgetRepository().getTransactions();
    transactions.addAll(result);
  }

  Color getCategoryColor(String category) {
    switch (category) {
      case 'Entertainment':
        return Colors.red[400]!;
      case 'Food':
        return Colors.green[400]!;
      case 'Personal':
        return Colors.blue[400]!;
      case 'Transportation':
        return Colors.purple[400]!;
      default:
        return Colors.orange[400]!;
    }
  }
}
