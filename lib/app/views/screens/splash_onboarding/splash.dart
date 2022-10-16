
import 'package:elmawkef_inc/app/controllers/slpash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends GetResponsiveView<SplashController> {

  @override
  final controller = Get.put(SplashController());


  @override
  Widget? phone() {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? Colors.black45 : Colors.white,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: screen.width * 0.2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 86,
              height: 86,
              child: Image.asset(
                Get.isDarkMode ? 'assets/logo_dark.png' : 'assets/logo.png',
              ),
            ),
            RichText(
              text: TextSpan(
                text: "Elma",
                children: [
                  TextSpan(
                    text: "Wkef",
                    style: TextStyle(
                        color:
                            Get.isDarkMode ? Color(0xff03DAC5) : Colors.black,
                        fontSize: 28),
                  ),
                ],
                style: TextStyle(
                    color:
                        Get.isDarkMode ? Color(0xffBB86FC) : Colors.blueAccent,
                    fontSize: 28),
              ),
            )
          ],
        ),
      ),
    );
  }
}
