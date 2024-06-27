import 'package:budget_tracker/src/controllers/budget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  final BudgetController controller = Get.put(BudgetController());

  _initData() async {
    if (controller.transactions.isEmpty) {
      await controller.fetchApi();
    }
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
