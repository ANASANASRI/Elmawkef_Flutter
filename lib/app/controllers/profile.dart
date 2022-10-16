import 'package:elmawkef_inc/app/models/gender.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class ProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late TextEditingController phoneController;
  late TextEditingController nameController;
  late String initialCountry;
  PhoneNumber number = PhoneNumber(isoCode: 'MA');
  RxString selectedValue = 'Jardinage'.obs;
  List<GenderModel> genders = [
    GenderModel("Male", Icons.male, false),
    GenderModel("Female", Icons.female, false)
  ];

  late RxBool becomePro;
  late RxInt counter;
  RxBool editMode = false.obs;

  List<String> categires = [
    "Jardinage",
    "Peinture",
    "Serrurerie",
    "Tapisserie",
    "Aluminium",
    "Parabole TV",
    "Climatisation",
    "Camera",
    "Parquet",
    "Electricité",
    "Plomberie"
  ];

  @override
  void onInit() {
    phoneController = TextEditingController();
    nameController = TextEditingController();
    initialCountry = 'MA';
    becomePro = false.obs;
    counter = 0.obs;
  }

  void inc() {
    if (counter.value + 1 > 50) {
      counter.value = 50;
    } else {
      counter.value++;
    }
  }

  void dec() {
    if (counter.value - 1 < 0) {
      counter.value = 0;
    } else {
      counter.value--;
    }
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    phoneController.dispose();
    nameController.dispose();
  }
}
