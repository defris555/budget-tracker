import 'package:budget_tracker/src/models/transaction_model.dart';
import 'package:budget_tracker/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:uuid/uuid.dart';

enum TransactionType { income, expenses }

class AddController extends GetxController {
  var activeCategory = 0.obs;
  var category = ''.obs;
  var date = DateTime.now().obs;
  var name = ''.obs;
  var price = 0.0.obs;
  var type = TransactionType.expenses.obs;

  @override
  void onInit() {
    super.onInit();
    setCategory(0);
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
  }

  void setName(String value) {
    name.value = value;
  }

  void setCategory(int index) {
    activeCategory.value = index;
    category = categories[activeCategory.value].obs;
  }

  IconData getCategoryIcon(String value) {
    switch (value) {
      case 'food':
        return MdiIcons.food;
      case 'cloth':
        return MdiIcons.hanger;
      case 'entertainment':
        return MdiIcons.theater;
      case 'transportation':
        return MdiIcons.trainCar;
      case 'personal':
        return MdiIcons.cardAccountDetails;
      default:
        return MdiIcons.starShooting;
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

  Future<void> addTransaction() async {
    //TODO add transaction
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
    print('Add transaction ${transaction.toMap()}');
  }
}
