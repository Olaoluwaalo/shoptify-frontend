import 'package:e_commerce/common/text_widget.dart';
import 'package:e_commerce/core/constants/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.color,
    required this.buttonText,
    this.onTap, this.borderRadius,
  });
  final Color? color;
  final String buttonText;
  final Function()? onTap;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color ?? EColors.primaryColor,
          borderRadius: borderRadius ??
              BorderRadius.circular(
                30.r,
              ),
        ),
        child: Center(
          child: boldText(
            text: buttonText,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class GoogleOrFacebookAuthButton extends StatelessWidget {
  const GoogleOrFacebookAuthButton({
    super.key,
    this.color,
    required this.buttonText,
    this.onTap,
    required this.image,
  });
  final Color? color;
  final String buttonText;
  final String image;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(
            30.r,
          ),
          border: Border.all(
            color: Colors.grey.withOpacity(
              0.2,
            ),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Image.asset(image),
              ),
              SizedBox(
                width: 10.w,
              ),
              boldText(
                text: buttonText,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
