import 'package:budget_tracker/src/controllers/add_controller.dart';
import 'package:budget_tracker/src/controllers/budget_controller.dart';
import 'package:budget_tracker/src/controllers/root_controller.dart';
import 'package:get/get.dart';

class Bind extends Bindings {
  @override
  void dependencies() {
    Get.put<RootController>(RootController(), permanent: true);
    Get.put<BudgetController>(BudgetController(), permanent: true);
    Get.lazyPut<AddController>(() => AddController(), fenix: true);
  }
}
