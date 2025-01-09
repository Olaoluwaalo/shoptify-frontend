import 'package:e_commerce/app.dart';
import 'package:e_commerce/features/authentication/controllers/register_controller.dart';
import 'package:e_commerce/features/authentication/controllers/sign_in_controller.dart';
import 'package:e_commerce/features/home/controllers/home_controller.dart';
import 'package:e_commerce/features/home/controllers/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => SignInController(),
          ),
          ChangeNotifierProvider(
            create: (context) => RegisterController(),
          ),
          ChangeNotifierProvider(
            create: (context) => HomeController(),
          ),
          ChangeNotifierProvider(
            create: (context) => PaymentController(),
          ),
        ],
        child: const MyApp(),
      ),
    );
  });
}
