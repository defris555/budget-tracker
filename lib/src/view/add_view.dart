import 'package:budget_tracker/src/controllers/add_controller.dart';
import 'package:budget_tracker/src/widgets/add_button.dart';
import 'package:budget_tracker/src/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../utils/colors.dart';

class AddView extends GetView<AddController> {
  const AddView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ColoredBox(
          color: grey.withOpacity(0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ColoredBox(
                color: white,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(MdiIcons.arrowLeft),
                      color: iconBlack,
                      splashColor: secondary,
                      onPressed: () => Get.back(),
                    ),
                    const Text(
                      'Добавить транзакцию',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              const NewTransaction(),
              const AddButton(),
            ],
          ),
        ),
      ),
    );
  }
}
