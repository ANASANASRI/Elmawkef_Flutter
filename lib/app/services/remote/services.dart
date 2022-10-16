import 'package:elmawkef_inc/app/models/work.dart';
import 'package:get/get.dart';

import '../../models/category.dart';

class WorkService extends GetConnect {
  Future<List<CategoryModel>> fetchAll() async {
    List<CategoryModel> catogries = <CategoryModel>[];
    final response = await get('https://app.elmawkef.com/api/categories');

    if (response.statusCode == 200) {
      var data = response.body['data'];
      for (var item in data) {
        CategoryModel category = CategoryModel.fromJson(item);
        catogries.add(category);
      }
      return catogries;
    } else {
      //show error message
      return catogries;
    }
  }

  Future<List<WorkModel>?> fetchService() async {
    final response =
        await get('https://app.elmawkef.com/api/services/?populate=*');
    List<WorkModel> services = [];
    if (response.statusCode == 200) {
      var data = response.body['data'];
      for (var item in data) {
        WorkModel workModel = WorkModel.fromJson(item);
        services.add(workModel);
      }

      return services;
    }
    return services;
  }

  Future<WorkModel?> fetchServiceById(int id) async {
    final response =
        await get('https://app.elmawkef.com/api/services/$id/?populate=*');
    if (response.statusCode == 200) {
      var data = response.body['data'];
      return WorkModel.fromJson(data);
    }

    return WorkModel(
        samples: [],
        id: 0,
        title: '',
        customer_id: 0,
        category: '',
        description: '',
        category_id: 0,
        experience: 0);
  }
}
