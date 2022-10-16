import 'package:elmawkef_inc/app/models/onboarding.dart';
import 'package:elmawkef_inc/app/router/routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingController extends GetxController {
  late List<OnboardModel> pages;
  late RxInt currentIndex;
  late PageController pageController;

  @override
  void onInit() async {
    super.onInit();
    currentIndex = 0.obs;
    pageController = PageController();
    pages = [
      OnboardModel(
          image: "assets/images/Onboarding1.png",
          title: "Quick and Easy Booking".tr,
          description:
              "We offer a 3-step booking which solves your problem quickly and easily"
                  .tr),
      OnboardModel(
          image: "assets/images/Onboarding2.png",
          title: "Security and Professionalism".tr,
          description:
              "All our domestic workers have transparent background and are well-trained "
                  .tr),
      OnboardModel(
          image: "assets/images/Onboarding3.png",
          title: "Give your home a Wow feeling".tr,
          description:
              "We care about every small details to sastisfy your needs when you use our service"
                  .tr),
    ];
  }

  void pageChange(int position) async {
    if (currentIndex.value == 2) {
      _updateSeen();
      Get.offNamed(AppRoutes.signup);
    } else {
      currentIndex.value = position;
    }
  }

  void nextPage(){
    pageController.animateToPage(pageController.page!.toInt() + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn
    );
  }


  void _updateSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);
  }
  @override
  void onReady() {}

  @override
  void onClose() {
    pageController.dispose();
  }
}
