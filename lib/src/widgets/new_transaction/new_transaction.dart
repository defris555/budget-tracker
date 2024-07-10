import 'package:budget_tracker/src/controllers/add_controller.dart';
import 'package:budget_tracker/src/widgets/new_transaction/input_fields.dart';
import 'package:budget_tracker/src/widgets/new_transaction/type_choice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import 'category_choice.dart';

class NewTransaction extends GetView<AddController> {
  const NewTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Выберите категорию',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: black.withOpacity(0.5)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const CategoryChoice(),
        const InputFields(),
        const TypeChoice(),
      ],
    );
  }
}
