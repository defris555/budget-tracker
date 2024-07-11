import 'package:budget_tracker/src/controllers/budget_controller.dart';
import 'package:budget_tracker/src/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChartView extends GetView<BudgetController> {
  const ChartView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: grey.withOpacity(0.05),
      child: controller.spending.isEmpty
          ? const Center(
              child: Text(
                'Пока ничего нет',
                style: TextStyle(color: iconBlack),
              ),
            )
          : Column(
              children: [
                Card(
                  margin: const EdgeInsets.all(8.0),
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    height: 360.0,
                    child: Column(
                      children: [
                        Expanded(
                          child: PieChart(
                            PieChartData(
                              sections: controller.spending
                                  .map((category, price) => MapEntry(
                                        category,
                                        PieChartSectionData(
                                          color: controller
                                              .getCategoryColor(category),
                                          radius: 100.0,
                                          title: '₽${price.toStringAsFixed(2)}',
                                          value: price,
                                        ),
                                      ))
                                  .values
                                  .toList(),
                              sectionsSpace: 0,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: controller.spending.keys
                              .map((category) => _Indicator(
                                    color:
                                        controller.getCategoryColor(category),
                                    text: controller.getCategoryName(category),
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }
}

class _Indicator extends StatelessWidget {
  final Color color;
  final String text;

  const _Indicator({
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 16.0,
          width: 16.0,
          color: color,
        ),
        const SizedBox(width: 4.0),
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
