import 'package:e_commerce/common/text_widget.dart';
import 'package:e_commerce/core/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget logo() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        EImages.logo,
        height: 30.h,
      ),
      SizedBox(
        width: 7.w,
      ),
      boldText(
        text: "shoptify",
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
      )
    ],
  );
}
