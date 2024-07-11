import 'package:budget_tracker/src/controllers/budget_controller.dart';
import 'package:budget_tracker/src/models/transaction_model.dart';
import 'package:budget_tracker/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

enum TransactionType { income, expenses }

class AddController extends GetxController {
  final nameController = TextEditingController(text: 'Название');
  final priceController = TextEditingController(text: 'Сумма');
  final dateController = TextEditingController();
  var activeCategory = 0.obs;
  var category = ''.obs;
  var date = DateTime.now().obs;
  var name = ''.obs;
  var price = 0.0.obs;
  var type = TransactionType.expenses.obs;
  var isExist = false.obs;

  @override
  void onInit() {
    super.onInit();
    setCategory(0);
    final date = DateFormat('dd.MM.yy').format(DateTime.now());
    dateController.text = date;
  }

  void setTransactionToEdit(Transaction transaction) {
    //TODO check setTransactionToEdit
    final dt = DateFormat('dd.MM.yy').format(transaction.date);
    isExist.value = true;
    setType(transaction.type == 'expenses' ? 0 : 1);
    setCategory(categories.indexOf(transaction.category));
    setName(transaction.name);
    setPrice(transaction.price);
    setDate(dt);
    nameController.text = transaction.name;
    priceController.text = transaction.price.toString();
    dateController.text = dt;
    update();
  }

  void setType(int index) {
    if (index == 0) {
      type.value = TransactionType.expenses;
      return;
    }
    type.value = TransactionType.income;
  }

  void setDate(String value) {
    date.value = DateTime.parse(value);
  }

  void setPrice(double value) {
    price.value = value;
    update();
  }

  void setName(String value) {
    name.value = value;
  }

  void setCategory(int index) {
    activeCategory.value = index;
    category = categories[activeCategory.value].obs;
  }

  void addTransaction() {
    final String id = const Uuid().v4(); //Generate Random id
    final String typeValue =
        type.value == TransactionType.income ? 'income' : 'expenses';
    final Map<String, dynamic> transactionMap = {
      'id': id,
      'name': name.value,
      'type': typeValue,
      'category': category.value,
      'price': price.value,
      'date': date.value.toIso8601String(),
    };
    final transaction = Transaction.fromMap(transactionMap);
    final controller = Get.find<BudgetController>();
    controller.addTransaction(transaction);
  }

  void clear() {
    activeCategory = 0.obs;
    category = ''.obs;
    date = DateTime.now().obs;
    name = ''.obs;
    price = 0.0.obs;
    type = TransactionType.expenses.obs;
    isExist = false.obs;
    nameController.text = 'Название';
    priceController.text = 'Сумма';
    dateController.text = DateFormat('dd.MM.yy').format(DateTime.now());
  }
}
