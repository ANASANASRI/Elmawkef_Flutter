import 'package:get/get.dart';

import '../models/work.dart';

class BookingController extends GetxController {
  late RxList<WorkModel> bookingsList;

  @override
  void onInit() {
    bookingsList = <WorkModel>[].obs;
    super.onInit();
  }

  @override
  void onReady() {}

  void addBooking(WorkModel workModel) {
    if (bookingsList.value.any((element) => element.id == workModel.id)) {
      bookingsList.remove(workModel);
    } else {
      bookingsList.add(workModel);
    }
  }

  RxBool isInBookin(WorkModel workModel) {
    RxBool isIn = false.obs;
    isIn.value = bookingsList.value.any((element) => element.id == workModel.id);
    return isIn;
  }

  @override
  void onClose() {}
}
