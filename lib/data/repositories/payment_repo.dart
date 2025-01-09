import 'dart:convert';
import 'dart:developer';
import 'package:e_commerce/common/snackbar.dart';
import 'package:e_commerce/core/constants/api_constants.dart';
import 'package:e_commerce/core/errors/http_error_handling.dart';
import 'package:e_commerce/data/models/payment_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PaymentRepo {
  initializePayment({
    required String email,
    required int amount,
    required BuildContext context,
  }) async {
    try {
      final payBody = {
        "email": email,
        "amount": amount,
        "cloth": "Yello cloth",
        "size": "24",
        "color": "pink"
      };
      final response = await http.post(
        Uri.parse(paystackUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          payBody,
        ),
      );
      httpErrorHandle(response: response, context: context, onSuccess: () {});
      if (response.statusCode == 200) {
        log(response.body);
        return paymentDataFromJson(response.body);
      }
    } catch (e) {
      return showSnackBar(context, e.toString());
    }
  }
}
