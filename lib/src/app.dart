import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/bind.dart';
import 'view/budget_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      initialBinding: Bind(),
      home: const BudgetView(),
    );
  }
}
