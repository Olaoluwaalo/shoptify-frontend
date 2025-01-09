import 'dart:convert';
import 'dart:developer';
import 'package:e_commerce/common/snackbar.dart';
import 'package:e_commerce/core/constants/api_constants.dart';
import 'package:e_commerce/core/errors/http_error_handling.dart';
import 'package:e_commerce/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  registerUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final Map<String, dynamic> regBody = {
        "name": name,
        "email": email,
        "password": password,
      };

      final response = await http.post(
        Uri.parse(registerUrl),
        body: jsonEncode(regBody),
        headers: {'Content-Type': 'application/json'},
      );
      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () {
            final data = jsonDecode(response.body);
            showSnackBar(
              context,
              "User with ${data["user"]["email"]} is registered, Proceed to login",
            );
            userFromJson(response.body);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {

      final body = {
        "email": email,
        "password": password,
      };
      final response = await http.post(
        Uri.parse(loginUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(
          body,
        ),
      );
      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () async {
            log("In");
            final data = jsonDecode(response.body);

            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            await prefs.setString("token", data["token"]);
            final token = prefs.getString("token");
            context.go("/homeScreen/$token");
            log(token!);
          });
      return userFromJson(response.body);
    } catch (e) {
      return showSnackBar(context, e.toString());
    }
  }
}
// Post a new product (image as a Cloudinary link)
Future<void> postProduct(String productName, String productImagePath, double rating, String description) async {
  var request = http.MultipartRequest('POST', Uri.parse(baseUrl));
  request.fields['productName'] = productName;
  request.fields['rating'] = rating.toString();
  request.fields['description'] = description;

  request.files.add(await http.MultipartFile.fromPath('productImage', productImagePath));

  var response = await request.send();

  if (response.statusCode != 201) {
    throw Exception('Failed to post product');
  }
}