import 'package:budget_tracker/src/controllers/add_controller.dart';
import 'package:budget_tracker/src/controllers/budget_controller.dart';
import 'package:budget_tracker/src/controllers/root_controller.dart';
import 'package:get/get.dart';

class Bind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(() => RootController(), fenix: true);
    Get.lazyPut<AddController>(() => AddController(), fenix: true);
    Get.lazyPut<BudgetController>(() => BudgetController(), fenix: true);
  }
}
