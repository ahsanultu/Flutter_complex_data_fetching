import 'package:flutter/cupertino.dart';
import 'package:flutter_navigation/models/fetch_provider_model.dart';
import 'package:http/http.dart' as http;

class FetchProvider with ChangeNotifier {
  List<FetchProviderModel> _fetchList = [];
  List<FetchProviderModel> _childrens = [];

  List<FetchProviderModel> get fetchList => _fetchList;
  List<FetchProviderModel> get childrens => _childrens;

  Future<List<FetchProviderModel>> getFetchList() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/v1/categories'));
    if (response.statusCode == 200) {
      return categoryFromJson(response.body);
    } else {
      throw Exception('Failed to load categories');
    }
  }

  void setChildren(category) {
    _childrens = category.children;
    notifyListeners();
  }
}
