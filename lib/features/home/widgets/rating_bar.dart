import 'package:e_commerce/common/text_widget.dart';
import 'package:e_commerce/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget({
    super.key,
    required this.product,
  });

  final dynamic product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          initialRating: product.rating.toDouble(),
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 15.sp,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.h),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {},
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 3.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              30.r,
            ),
            color: EColors.primaryColor.withOpacity(
              0.2,
            ),
          ),
          child: Row(
            children: [
              boldText(text: "${product.rating}.0"),
              SizedBox(
                width: 10.w,
              ),
              lightText(
                text: "(${product.review} review)",
                fontSize: 15.sp,
              )
            ],
          ),
        )
      ],
    );
  }
}
