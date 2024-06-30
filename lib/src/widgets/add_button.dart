import 'package:budget_tracker/src/controllers/add_controller.dart';
import 'package:budget_tracker/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddButton extends GetView<AddController> {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.addTransaction(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: 50,
          decoration: BoxDecoration(
              color: primary.withOpacity(.7),
              borderRadius: BorderRadius.circular(15)),
          child: const Center(
            child: Text(
              'Сохранить',
              style: TextStyle(
                color: white,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
