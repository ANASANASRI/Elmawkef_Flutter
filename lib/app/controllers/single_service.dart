import 'package:elmawkef_inc/app/models/customer.dart';
import 'package:elmawkef_inc/app/models/work.dart';
import 'package:elmawkef_inc/app/services/remote/customer.dart';
import 'package:elmawkef_inc/app/services/remote/services.dart';
import 'package:get/get.dart';

class SingleServiceController extends GetxController {
  WorkService workService = WorkService();
  CustomerService customerService = CustomerService();
  WorkModel workModel = Get.arguments;
  late CustomerModel customerModel;

  @override
  void onInit() async {
    workModel = Get.arguments;
    customerModel = await customerService.fetchUserById(workModel.customer_id);
  }

  @override
  void onReady() async {
    workModel = Get.arguments;
    customerModel = await customerService.fetchUserById(workModel.customer_id);
  }

  @override
  void onClose() {}
}
