import 'package:budget_tracker/src/controllers/add_controller.dart';
import 'package:budget_tracker/src/controllers/budget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';

class CategoryChoice extends GetView<AddController> {
  const CategoryChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .9,
      height: MediaQuery.sizeOf(context).width * .65,
      child: Obx(
        () => GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          mainAxisSpacing: 0.1,
          children: List.generate(
            categories.length,
            (index) {
              return GestureDetector(
                onTap: () => controller.setCategory(index),
                child: Container(
                  width: 10,
                  height: 25,
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: controller.activeCategory.value == index
                        ? primary.withOpacity(.8)
                        : primary.withOpacity(.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        getCategoryIcon(
                          categories[index],
                        ),
                        color: controller.activeCategory.value == index
                            ? iconWhite
                            : iconBlack,
                      ),
                      Text(
                        Get.find<BudgetController>().getCategoryName(
                          categories[index],
                        ),
                        style: TextStyle(
                          color: controller.activeCategory.value == index
                              ? white
                              : black,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  IconData getCategoryIcon(String value) {
    switch (value) {
      case 'food':
        return MdiIcons.food;
      case 'cloth':
        return MdiIcons.hanger;
      case 'entertainment':
        return MdiIcons.theater;
      case 'transportation':
        return MdiIcons.trainCar;
      case 'personal':
        return MdiIcons.cardAccountDetails;
      default:
        return MdiIcons.starShooting;
    }
  }
}
