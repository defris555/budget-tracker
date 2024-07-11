import 'package:budget_tracker/src/controllers/add_controller.dart';
import 'package:budget_tracker/src/utils/colors.dart';
import 'package:budget_tracker/src/view/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddController>(builder: (controller) {
      return InkWell(
        onTap: double.tryParse(controller.priceController.text) == null
            ? null
            : () {
                controller.addTransaction();
                controller.clear();
                Get.to(() => const RootScreen());
              },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * .9,
            height: 50,
            decoration: BoxDecoration(
                color: double.tryParse(controller.priceController.text) == null
                    ? iconBlack
                    : primary.withOpacity(.8),
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
    });
  }
}
