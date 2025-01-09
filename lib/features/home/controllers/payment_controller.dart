import 'dart:developer';

import 'package:e_commerce/common/snackbar.dart';
import 'package:e_commerce/data/models/payment_model.dart';
import 'package:e_commerce/data/repositories/payment_repo.dart';
import 'package:flutter/material.dart';

class PaymentController with ChangeNotifier {
  final PaymentRepo paymentRepo = PaymentRepo();
   PaymentData? paymentData;
  Future<void> initPayment({
    required BuildContext context,
    required String email,
    required int amount,
  }) async {
    try {
      final data = await paymentRepo.initializePayment(
          email: email, amount: amount, context: context);
      paymentData = data;
      log(paymentData!.authorizationUrl);
      notifyListeners();
    } catch (e) {
      return showSnackBar(context, e.toString());
    }
  }
}
