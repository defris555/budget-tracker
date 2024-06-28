import 'package:budget_tracker/src/controllers/budget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BudgetView extends GetView<BudgetController> {
  const BudgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Budget Tracker'),
      ),
      body: ListView.builder(
          itemCount: controller.transactions.length,
          itemBuilder: (context, index) {
            final item = controller.transactions[index];
            return Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  width: 2.0,
                  color: controller.getCategoryColor(item.category),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
