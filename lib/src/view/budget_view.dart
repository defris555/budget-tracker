import 'package:budget_tracker/src/controllers/budget_controller.dart';
import 'package:budget_tracker/src/utils/colors.dart';
import 'package:budget_tracker/src/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BudgetView extends StatelessWidget {
  const BudgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: grey.withOpacity(0.05),
      child: Column(
        children: [
          const Header(),
          GetBuilder<BudgetController>(builder: (controller) {
            final transactions = controller.showAll.value
                ? controller.transactions
                : controller.transactionsByDate;
            return Expanded(
              child: transactions.isEmpty
                  ? const Center(
                      child: Text(
                        'Пока ничего нет',
                        style: TextStyle(color: iconBlack),
                      ),
                    )
                  : ListView.builder(
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        final item = transactions[index];
                        final color =
                            item.type == 'income' ? lightBlue : lightOrange;
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: item.type == 'income'
                                ? incomeColor
                                : expensesColor,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              width: 3.0,
                              color: color,
                            ),
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
                              '${item.type == "income" ? "+" : "-"} ${item.price} ₽',
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        );
                      },
                    ),
            );
          }),
        ],
      ),
    );
  }
}
