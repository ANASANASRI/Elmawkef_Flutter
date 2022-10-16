import 'package:elmawkef_inc/app/controllers/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBottom extends GetResponsiveView<BottomNavigationController> {
  final bottomNavController = Get.put(BottomNavigationController());

  @override
  Widget? phone() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined), label: "Home".tr),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Services".tr),
        BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined), label: "Booking".tr),
      ],
      currentIndex: bottomNavController.index.value,
      onTap: (int index) {
        bottomNavController.updateIndex(index);
      },
    );
  }
}
