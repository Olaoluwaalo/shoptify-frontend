import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Text boldText(
    {required String text,
    double? fontSize,
    FontWeight? fontWeight,
    int? maxLines,
    bool? softWrap,
    TextOverflow? overflow,
    Color? color}) {
  return Text(
    maxLines: maxLines,
    softWrap: softWrap,
    overflow: overflow,

    text,
    style: GoogleFonts.nunito(
      
        fontSize: fontSize ?? 20.sp,
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color),
  );
}

Text lightText(
    {required String text,
    double? fontSize,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
    bool? softWrap,
    TextOverflow? overflow,
    Color? color}) {
  return Text(
    maxLines: maxLines,
    softWrap: softWrap,
    overflow: overflow,
    textAlign: textAlign,
    text,
    style: GoogleFonts.nunito(
      fontSize: fontSize ?? 20.sp,
      color: color ?? Colors.grey,
      fontWeight: fontWeight,
    ),
  );
}
