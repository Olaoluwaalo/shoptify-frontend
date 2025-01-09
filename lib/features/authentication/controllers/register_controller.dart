import 'package:e_commerce/data/models/user_model.dart';
import 'package:e_commerce/data/repositories/user_repo.dart';
import 'package:flutter/material.dart';

class RegisterController with ChangeNotifier {
  User? _user;
  User? get user => _user;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get emailController => _emailController;
  TextEditingController get nameController => _nameController;
  TextEditingController get paaswordController => _passwordController;

  final UserRepository userRepository = UserRepository();
  Future<void> registerUser({
    required BuildContext context,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();
      await userRepository.registerUser(
        context: context,
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      _isLoading = false;
      notifyListeners();
       } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }
}
