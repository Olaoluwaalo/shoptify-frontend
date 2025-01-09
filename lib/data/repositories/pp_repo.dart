
import 'package:e_commerce/core/constants/api_constants.dart';
import 'package:e_commerce/core/errors/http_error_handling.dart';
import 'package:e_commerce/data/models/popular_products.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PpRepo {
  Future<PopularProducts?> getAllProducts(BuildContext context) async {
    final response = await http.get(Uri.parse(getAllProductsUrl));
    httpErrorHandle(response: response, context: context, onSuccess: () {});
    if (response.statusCode == 200) {
      return popularProductsFromJson(response.body);
    }
    return null;
  }
}
