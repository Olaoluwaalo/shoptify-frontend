import 'package:e_commerce/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.product,
  });

  final dynamic product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: EHelpers.isDarkMode(context)
            ? Colors.grey.shade900.withOpacity(0.9)
            : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(
          20.r,
        ),
      ),
      height: 400.h,
      child: Center(
        child: Image.network(
          product.productImage,
        ),
      ),
    );
  }
}
