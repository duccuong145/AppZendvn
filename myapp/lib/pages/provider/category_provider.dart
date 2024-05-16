import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/models/categories_models.dart';
import 'package:myapp/models/product.dart';

class CategoriesProvider extends ChangeNotifier {
  Future<List<Categories>> getCategories() async {
    const url = 'http://apiforlearning.zendvn.com/api/mobile/categories';
    try {
      final response = await http.get(Uri.parse(url));
      final List<dynamic> jsonData = json.decode(response.body);
      List<Categories> categories =
          jsonData.map((category) => Categories.fromMap(category)).toList();
      return categories;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<Product>> getProductCategory(int id) async {
    final url =
        'http://apiforlearning.zendvn.com/api/mobile/categories/$id/products';
    Uri uri = Uri.parse(url);
    final finalUrl = uri.replace(queryParameters: {});
    try {
      final response = await http.get(finalUrl);
      final jsonData = jsonDecode(response.body);
      List<Product> data = List<Product>.from(
              jsonData.map((product) => Product.fromJson(jsonEncode(product))))
          .toList();
      return data;
    } catch (e) {
      return Future.error(e);
    }
  }
}
