import 'package:budget_tracker/src/models/transaction_model.dart';
import 'package:budget_tracker/src/repository/budget_repository.dart';
import 'package:budget_tracker/src/utils/colors.dart';
import 'package:budget_tracker/src/utils/constants.dart';
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

  Future<void> addTransaction() async {
    //TODO addTransaction
  }

  Color getBorderColor(String transactionType) {
    if (transactionType == income) {
      return lightBlue;
    }
    return lightOrange;
  }
}
