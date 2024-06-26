import 'package:budget_tracker/src/view/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/bind.dart';

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
      home: const RootScreen(),
    );
  }
}
