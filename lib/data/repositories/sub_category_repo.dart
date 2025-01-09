

import 'package:e_commerce/core/constants/api_constants.dart';
import 'package:e_commerce/core/errors/http_error_handling.dart';

import 'package:e_commerce/data/models/sub_category_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SubCategoryRepo {
  Future<SubCategories?> getSubCategory({
    required BuildContext context,
     String? productId,
  }) async {
     final String url = productId == null
          ? getAllSubCategoryUrl
          : "$getAllSubCategoryUrl/$productId";
    final response =
        await http.get(Uri.parse(url));
    httpErrorHandle(response: response, context: context, onSuccess: () {});
    if (response.statusCode == 200) {
      // log(response.body);
      return subCategoriesFromJson(response.body);
    }
    return null;
  }
}
