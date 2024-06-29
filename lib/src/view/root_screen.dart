import 'package:budget_tracker/src/controllers/root_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final controller = Get.find<RootController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          body: controller.getBody(),
          bottomNavigationBar: controller.getFooter(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add, size: 25.0),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}
