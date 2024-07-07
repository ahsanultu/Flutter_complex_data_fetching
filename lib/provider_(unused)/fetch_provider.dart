import 'package:flutter/cupertino.dart';
import 'package:flutter_navigation/models/category_model.dart';
import 'package:http/http.dart' as http;

class FetchProvider with ChangeNotifier {
  List<CategoryModel> _fetchList = [];
  List<CategoryModel> _childrens = [];

  List<CategoryModel> get fetchList => _fetchList;
  List<CategoryModel> get childrens => _childrens;

  Future<CategoryModel> getFetchList() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/v1/categories'));
    if (response.statusCode == 200) {
      return categoryModelFromJson(response.body);
    } else {
      throw Exception('Failed to load categories');
    }
  }

  void setChildren(category) {
    _childrens = category.children;
    notifyListeners();
  }
}
