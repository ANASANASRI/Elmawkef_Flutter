import 'package:elmawkef_inc/app/models/customer.dart';
import 'package:get/get.dart';

class CustomerService extends GetConnect {
  Future<CustomerModel> fetchUserById(int id) async {
    final response =
        await get("https://app.elmawkef.com/api/customers/$id/?populate=*");
    if (response.statusCode == 200) {
      var data = response.body['data'];
      return CustomerModel.fromJson(data);
    }

    return CustomerModel(id: 0, name: 'zakaria', phone_number: '694334962');
  }
}
