import 'package:budget_tracker/src/controllers/budget_controller.dart';
import 'package:get/get.dart';

class Bind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BudgetController>(() => BudgetController());
  }
}
