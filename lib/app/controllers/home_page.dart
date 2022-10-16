import 'package:elmawkef_inc/app/models/service.dart';
import 'package:elmawkef_inc/app/services/remote/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageController extends GetxController {
  late List<Service> services;
  late RxInt selectedService;
  late SharedPreferences prefs;
  late String? userName;

  WorkService workService = WorkService();

  @override
  void onInit() async {
    selectedService = 4.obs;
    workService = WorkService();
    prefs = await SharedPreferences.getInstance();
    await getUserName();
    await getPhoneNumber();
    super.onInit();
  }

  Future<String?> getUserName() async {
    userName = await prefs.getString('user_name');
    return userName?.toUpperCase();
  }

  Future<String?> getPhoneNumber() async {
    String number = "06-XX-XXX-XXX";
    int? num = 0;
    num = await prefs.getInt('phone_number');
    number = num.toString();
    return number?.toUpperCase();
  }

  @override
  void onClose() {}

  @override
  void onReady() async {
    await getUserName();
    await getPhoneNumber();
  }
}
