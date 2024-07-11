import 'package:budget_tracker/src/models/transaction_model.dart';
import 'package:budget_tracker/src/utils/extensions.dart';
import 'package:get/get.dart';

import '../utils/constants.dart';

class BudgetController extends GetxController {
  var transactions = <Transaction>[].obs;
  var transactionsByDate = <Transaction>[].obs;
  var selectedDate = DateTime.now().dateOnly();
  var showAll = false.obs;

  @override
  void onInit() async {
    super.onInit();
    getTransactions();
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

  void addTransaction(Transaction item) {
    transactions.add(item);
    final Map<String, dynamic> map = box.read('transactions') ?? {};
    map[item.id] = item.toMap();
    box.write('transactions', map);
    setDate(DateTime.now());
    sortByDate();
    update();
  }

  setDate(DateTime date) {
    selectedDate = (date).dateOnly();
  }
}
