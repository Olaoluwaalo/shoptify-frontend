import 'package:e_commerce/common/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividerRow extends StatelessWidget {
  const DividerRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            endIndent: 9.w,
            height: 5,
            indent: 34.w,
            color: Colors.grey.withOpacity(0.3),
          ),
        ),
        lightText(
          text: "Or",
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
        ),
        Expanded(
          child: Divider(
            endIndent: 34.w,
            height: 5,
            indent: 9.w,
            color: Colors.grey.withOpacity(0.3),
          ),
        ),
      ],
    );
  }
}
