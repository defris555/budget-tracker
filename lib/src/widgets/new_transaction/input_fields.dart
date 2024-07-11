import 'package:budget_tracker/src/controllers/add_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../utils/colors.dart';

class InputFields extends GetView<AddController> {
  const InputFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: TextField(
            controller: controller.nameController,
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: Icon(
                MdiIcons.cashCheck,
                color: iconBlack,
              ),
            ),
            onChanged: (value) => controller.setName(value),
            onTap: () {
              controller.nameController.text = '';
              controller.setName('');
            },
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 20.0),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: controller.priceController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      MdiIcons.cashFast,
                      color: iconBlack,
                    ),
                  ),
                  onTap: () {
                    controller.priceController.text = '';
                    controller.setPrice(0);
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      controller.setPrice(0);
                    } else {
                      final price = double.tryParse(value);
                      controller.setPrice(price ?? 0);
                    }
                  },
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 20.0),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: TextField(
                  keyboardType: TextInputType.none,
                  controller: controller.dateController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      MdiIcons.cashClock,
                      color: iconBlack,
                    ),
                  ),
                  onTap: () => _selectDate(context),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(
        const Duration(days: 30),
      ),
      lastDate: DateTime.now().add(
        const Duration(days: 3),
      ),
    );
    if (pickedDate != null) {
      controller.dateController.text =
          DateFormat('dd.MM.yy').format(pickedDate);
      controller.setDate(pickedDate.toIso8601String());
    }
  }
}
