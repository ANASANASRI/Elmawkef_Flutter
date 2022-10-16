import 'package:elmawkef_inc/app/router/routers.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  late SharedPreferences prefs;

  @override
  void onInit() async {
    prefs = await SharedPreferences.getInstance();
    super.onInit();
  }

  @override
  void onReady() async {
    await Future.delayed(const Duration(seconds: 1), () {});
    bool? seen = prefs.getBool('seen');
    if (seen == null || seen == false) {
      Get.offNamed(AppRoutes.onboarding);
    } else {
      Get.offNamed(AppRoutes.signup);
    }
  }

  @override
  void onClose() {}
}
