import 'package:elmawkef_inc/app/router/routers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpController extends GetxController {
  late final TextEditingController otpController;
  late final GlobalKey<FormState> formKey;
  late final FirebaseAuth auth;

  late String verificationID;

  @override
  void onInit() {
    super.onInit();
    otpController = TextEditingController();
    formKey = GlobalKey<FormState>();
    auth = FirebaseAuth.instance;
    verificationID = Get.arguments[0];
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);
      print('value is $verificationID');
      print('sms is ${otpController.text}');
    await auth.signInWithCredential(credential).then(
          (_) {
        _updateSeen();
        Get.offAllNamed(AppRoutes.home);
      },
    );
  }

  void _updateSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('singIn', true);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    otpController.dispose();
  }
}