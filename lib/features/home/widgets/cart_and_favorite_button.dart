import 'package:e_commerce/common/custom_button.dart';
import 'package:e_commerce/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartAndFavoriteButton extends StatelessWidget {
  const CartAndFavoriteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: CustomButton(buttonText: "Add to Cart"),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: CustomButton(
            buttonText: "Add to Favorites",
            color: EHelpers.isDarkMode(context)
                ? Colors.white60
                : Colors.grey.shade900,
          ),
        ),
      ],
    );
  }
}