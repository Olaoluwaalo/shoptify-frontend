import 'dart:developer';

import 'package:e_commerce/data/repositories/user_repo.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SignInController with ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get emailController => _emailController;

  TextEditingController get paaswordController => _passwordController;
  String? _token;
  String? get token => _token;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isUserSignedIn = false;
  bool get isUserSignedIn => _isUserSignedIn;
  final UserRepository userRepository = UserRepository();
  Future<void> login({required BuildContext context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      await userRepository.signInUser(
        context: context,
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      _isLoading = false;
      _isUserSignedIn = true;
      notifyListeners();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      _token = prefs.getString("token");
      notifyListeners();
    } catch (e) {
      log(e.toString());
      _isLoading = false;
      notifyListeners();
    }
  }
}
