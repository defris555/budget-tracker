import 'package:budget_tracker/src/controllers/budget_controller.dart';
import 'package:budget_tracker/src/utils/colors.dart';
import 'package:budget_tracker/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BudgetView extends GetView<BudgetController> {
  const BudgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //TODO header widget
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemCount: controller.transactions.length,
                itemBuilder: (context, index) {
                  final item = controller.transactions[index];
                  final color = controller.getCategoryColor(item.category);
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: item.type == income ? incomeColor : expensesColor,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        width: 3.0,
                        color: color,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: color,
                          offset: const Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        item.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            '${item.category} • ',
                          ),
                          Text(
                            DateFormat('dd.MM.yy').format(item.date),
                          )
                        ],
                      ),
                      trailing: Text(
                        '- ${item.price} ₽',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
