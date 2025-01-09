import 'package:e_commerce/features/authentication/screens/sign_in_screen.dart';
import 'package:e_commerce/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/authentication/screens/sign_up_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();


class ERoute {
  static final GoRouter goRouter = GoRouter(
      initialLocation: "/signUpScreen",
      redirect: (context, state) async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        final String? token = prefs.getString("token");

        if (token == null || token.isEmpty) {
          return "/signUpScreen";
        } else if (JwtDecoder.isExpired(token)) {
        
          return "/signIn";
        } else {
          return "/homeScreen/$token";
        }
      },
      routes: [
        GoRoute(
          path: "/signUpScreen",
          builder: (context, state) {
            return const SignUpScreen();
          },
        ),
        GoRoute(
          path: "/signIn",
          builder: (context, state) {
            return const SignInScreen();
          },
        ),
        GoRoute(
          path: "/homeScreen/:token",
          builder: (context, state) {
            final token = state.pathParameters["token"];
            return HomeScreen(
              token: token!,
            );
          },
        ),
      ]);
}
