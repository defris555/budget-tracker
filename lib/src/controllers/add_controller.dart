import 'package:budget_tracker/src/controllers/budget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum TransactionType { income, expenses }

class AddController extends GetxController {
  var activeCategory = 0.obs;
  var category = ''.obs;
  var date = DateTime.now().obs;
  var name = ''.obs;
  var price = 0.0.obs;
  var type = TransactionType.income.obs;

  void setCategory(int index) {
    activeCategory.value = index;
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
    final controller = Get.find<BudgetController>();
    final id = controller.transactions.length.toString().obs;
    // final transaction = Transaction();
    print('Add transaction ${id.value}');
  }
}
