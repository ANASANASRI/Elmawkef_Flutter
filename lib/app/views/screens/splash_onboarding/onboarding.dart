import 'package:elmawkef_inc/app/controllers/onboarding.dart';
import 'package:elmawkef_inc/app/router/routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class OnboardingScreen extends GetResponsiveView<OnboardingController> {
  @override
  final controller = Get.put(OnboardingController());

  @override
  Widget? desktop() {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            itemBuilder: (BuildContext context, int index) {
              return Obx(() => Row(
                    children: [
                      Flexible(
                        child: SizedBox(
                          child: Image.asset(
                            controller
                                .pages[controller.currentIndex.value].image
                                .toString(),
                            fit: BoxFit.contain,
                          ),
                          width: screen.width * 0.5,
                          height: screen.height * 0.45,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 24,
                            ),
                            Text(
                              controller
                                  .pages[controller.currentIndex.value].title
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 54,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Text(
                              controller.pages[controller.currentIndex.value]
                                  .description
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.1,
                                height: 1.5,
                              ),
                              softWrap: true,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                          ],
                        ),
                      )
                    ],
                  ));
            },
            itemCount: controller.pages.length,
            onPageChanged: (int index) {
              controller.pageChange(index);
            },
          ),
          Positioned(
            top: screen.height * 0.77,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screen.width * 0.45),
              child: SmoothPageIndicator(
                controller: controller.pageController,
                count: controller.pages.length,
                effect: const ExpandingDotsEffect(),
              ),
            ),
          ),
          Positioned(
            top: screen.height * 0.86,
            left: screen.width * 0.25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.pageChange(2);
                  },
                  child: Text(
                    "Skip".tr,
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: screen.width * 0.1),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.grey.shade100,
                    ),
                  ),
                ),
                SizedBox(
                  width: screen.width * 0.02,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.pageChange(controller.currentIndex.value);
                    controller.pageController
                        .jumpToPage(controller.currentIndex.value);
                  },
                  child: const Text("Next"),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: screen.width * 0.1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget? tablet() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 36, vertical: 48),
                child: Column(
                  children: [
                    SizedBox(
                      child: Image.asset(
                        controller.pages[controller.currentIndex.value].image
                            .toString(),
                        fit: BoxFit.contain,
                      ),
                      width: screen.width * 0.5,
                      height: screen.height * 0.4,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      controller.pages[controller.currentIndex.value].title
                          .toString(),
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      controller
                          .pages[controller.currentIndex.value].description
                          .toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.1,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              );
            },
            itemCount: controller.pages.length,
            onPageChanged: (int index) {
              controller.pageChange(index);
            },
          ),
          Positioned(
            top: screen.height * 0.63,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screen.width * 0.45),
              child: SmoothPageIndicator(
                controller: controller.pageController,
                count: controller.pages.length,
                effect: const ExpandingDotsEffect(),
              ),
            ),
          ),
          Positioned(
            top: screen.height * 0.75,
            left: screen.width * 0.17,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.signup);
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: screen.width * 0.1),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.grey.shade100,
                    ),
                  ),
                ),
                SizedBox(
                  width: screen.width * 0.1,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.pageChange(controller.currentIndex.value + 1);
                    controller.pageController
                        .jumpToPage(controller.currentIndex.value);
                  },
                  child: const Text("Next"),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: screen.width * 0.1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget? phone() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 36, vertical: 48),
                child: Column(
                  children: [
                    SizedBox(
                      child: Image.asset(
                        controller.pages[controller.currentIndex.value].image
                            .toString(),
                        fit: BoxFit.contain,
                      ),
                      width: screen.width * 0.7,
                      height: screen.height * 0.3,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      controller.pages[controller.currentIndex.value].title
                          .toString(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      controller
                          .pages[controller.currentIndex.value].description
                          .toString(),
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.1,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              );
            },
            itemCount: controller.pages.length,
            onPageChanged: (int index) {
              controller.pageChange(index);
            },
          ),
          Positioned(
            top: screen.height * 0.62,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screen.width * 0.4),
              child: SmoothPageIndicator(
                controller: controller.pageController,
                count: controller.pages.length,
                effect: const ExpandingDotsEffect(),
              ),
            ),
          ),
          Positioned(
            top: screen.height * 0.75,
            left: screen.width * 0.17,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.pageChange(2);
                  },
                  child: Text(
                    "Skip".tr,
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: screen.width * 0.1),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.grey.shade100,
                    ),
                  ),
                ),
                SizedBox(
                  width: screen.width * 0.1,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.pageChange(controller.currentIndex.value + 1);
                    controller.nextPage();
                  },
                  child: Text("Next".tr),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: screen.width * 0.1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
