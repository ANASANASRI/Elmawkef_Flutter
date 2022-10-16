import 'package:elmawkef_inc/app/models/category.dart';
import 'package:get/get.dart';

class CategoryService extends GetConnect {
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

  Future<CategoryModel?> fetchOne(int id) async {
    final response = await get('https://app.elmawkef.com/api/categories/$id');

    if (response.statusCode == 200) {
      var data = response.body['data'];

      CategoryModel category = CategoryModel.fromJson(data);

      return category;
    } else {
      //show error message
      throw Exception("find one");
    }
  }
}
