import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../controllers/add_controller.dart';

class TypeChoice extends GetView<AddController> {
  const TypeChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0),
      child: ToggleSwitch(
        initialLabelIndex: 0,
        minHeight: 45,
        minWidth: MediaQuery.of(context).size.width * .9,
        totalSwitches: 2,
        labels: const ['Расход', 'Доход'],
        animate: true,
        animationDuration: 400,
        onToggle: (index) {
          controller.setType(index ?? 0);
        },
      ),
    );
  }
}
