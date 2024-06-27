import 'dart:developer';

import 'package:budget_tracker/src/models/transaction_model.dart';
import 'package:budget_tracker/src/repository/budget_repository.dart';
import 'package:get/get.dart';

class BudgetController extends GetxController {
  var transactions = <Transaction>[].obs;

  Future<void> fetchApi() async {
    final result = await BudgetRepository().getTransactions();
    transactions.addAll(result);
    log('fetchApi: ${transactions.length}');
  }
}
