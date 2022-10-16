import 'package:elmawkef_inc/app/views/screens/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/screens/navigation_tabs/booking.dart';
import '../views/screens/navigation_tabs/home.dart';

class BottomNavigationController extends GetxController {
  late List<Widget> pages;
  late RxInt index;

  @override
  void onInit() {
    super.onInit();
    pages = [
      Home(),
      Services(),
      Booking(),
    ];
    index = 0.obs;
  }


  void updateIndex(int pos){
    index.value = pos;
    update();
  }

  @override
  void onReady() {}

  @override
  void onClose()  {

  }
}
