import 'package:elmawkef_inc/app/router/routers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController phoneController;
  late TextEditingController nameController;
  late String initialCountry;
  late final FirebaseAuth auth;
  late SharedPreferences prefs;
  late RxBool isVerifyingNumber;

  PhoneNumber number = PhoneNumber(isoCode: 'MA');

  @override
  void onInit() async {
    phoneController = TextEditingController();
    nameController = TextEditingController();
    initialCountry = 'MA';
    isVerifyingNumber = false.obs;
    prefs = await SharedPreferences.getInstance();
    bool? singIn = prefs.getBool('singIn');
    if (singIn == true) {
      Get.offAllNamed(AppRoutes.home);
    }
    super.onInit();
  }

  void verifyNumber(String phone,String name) async {
    await prefs.setInt(
        'phone_number', int.parse(phone));
    await prefs.setString('user_name',name);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        isVerifyingNumber.value = true;
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        Get.toNamed(AppRoutes.otp, arguments: [verificationId]);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  void onReady() async {
    await Firebase.initializeApp();
    auth = FirebaseAuth.instance;
  }

  @override
  void onClose() {
  }
}