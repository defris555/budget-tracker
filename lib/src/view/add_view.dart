import 'package:budget_tracker/src/controllers/add_controller.dart';
import 'package:budget_tracker/src/widgets/new_transaction/add_button.dart';
import 'package:budget_tracker/src/widgets/new_transaction/new_transaction.dart';
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
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: ColoredBox(
            color: grey.withOpacity(0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                const SizedBox(height: 20.0),
                const NewTransaction(),
                const Spacer(),
                const AddButton(),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
