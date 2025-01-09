import 'package:e_commerce/core/themes/e_theme.dart';
import 'package:e_commerce/routes/e_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 846),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig:ERoute.goRouter,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: ETheme.lightTheme,
        darkTheme: ETheme.darkTheme,
      );
      },
      
    );
  }
}
