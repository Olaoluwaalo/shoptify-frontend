import 'package:e_commerce/common/text_widget.dart';
import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileRow extends StatelessWidget {
  const ProfileRow({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: EColors.primaryColor,
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  boldText(
                    text: "Hi, $name",
                    fontSize: 20.sp,
                  ),
                  lightText(
                    text: "Welcome back",
                    fontSize: 15.sp,
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(
            10,
          ),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                offset: Offset(-1, -1),
                color: Colors.grey,
              ),
              BoxShadow(
                offset: Offset(1, 1),
                color: Colors.grey,
              ),
            ],
            color: EHelpers.isDarkMode(context)
                ? Colors.grey.shade900
                : const Color.fromARGB(255, 245, 245, 245),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.shopify_sharp),
        )
      ],
    );
  }
}
