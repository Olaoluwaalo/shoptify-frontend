import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.validator,
    this.controller,
    this.keyboardType,
    this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    this.prefixIcon,
  });
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            obscureText: obscureText,
            validator: validator,
            controller: controller,
            keyboardType: keyboardType,
            selectionControls: DesktopTextSelectionControls(),
            cursorColor:
                EHelpers.isDarkMode(context) ? Colors.grey : Colors.black,
            decoration: InputDecoration(
              prefixIcon: prefixIcon ??
                  const Icon(
                    Icons.search,
                  ),
              suffixIcon: suffixIcon,
              hintText: hintText,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 18.h,
              ),
              hintStyle: GoogleFonts.poppins(
                color: EColors.greyTextColor.withOpacity(0.6),
                fontSize: 12.sp,
              ),
              filled: true,
              fillColor: EHelpers.isDarkMode(context)
                  ? Colors.grey.shade900
                  : const Color.fromARGB(255, 245, 245, 245),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(
                  color: EColors.primaryColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 7.w,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
          decoration: BoxDecoration(
            color: EColors.primaryColor,
            borderRadius: BorderRadius.circular(
              15.r,
            ),
          ),
          child: Icon(
            Icons.manage_search,
            color: Colors.white,
            size: 35.sp,
          ),
        ),
      ],
    );
  }
}
