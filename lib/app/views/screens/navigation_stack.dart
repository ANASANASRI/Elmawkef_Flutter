import 'package:elmawkef_inc/app/controllers/bottom_nav.dart';
import 'package:elmawkef_inc/app/views/screens/shared/nav_bottom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  final bottomNavController =
      Get.put(BottomNavigationController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationController>(
      builder: (controller) {
        return Scaffold(
            body: SafeArea(
              child: IndexedStack(
                index: bottomNavController.index.value,
                children: bottomNavController.pages,
              ),
            ),
            bottomNavigationBar:
                NavBottom() // Your bottom navigation bar widget here,
            );
      },
    );
  }
}
