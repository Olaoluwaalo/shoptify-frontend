

import 'package:e_commerce/core/constants/api_constants.dart';
import 'package:e_commerce/core/errors/http_error_handling.dart';

import 'package:e_commerce/data/models/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoriesRepo {
  Future<Categories?> getAllCategories(BuildContext context) async {
    final response = await http.get(
      Uri.parse(
        getAllCategoriesUrl,
      ),
    );
    httpErrorHandle(response: response, context: context, onSuccess: () {});
    if (response.statusCode == 200) {
      final data = categoriesFromJson(response.body);
      return data;
    }
    return null;
 
  }
}
