import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenericScaffold extends StatelessWidget {
  const GenericScaffold({super.key, this.appBar, required this.children, this.crossAxisAlignment, this.bottomNavigationBar,});
  final PreferredSizeWidget? appBar;
  final List<Widget> children;
  final CrossAxisAlignment? crossAxisAlignment;
  final Widget? bottomNavigationBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 15.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:
                  crossAxisAlignment ?? CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
