import 'package:e_commerce/common/custom_button.dart';
import 'package:e_commerce/common/generic_scaffold.dart';
import 'package:e_commerce/common/snackbar.dart';
import 'package:e_commerce/common/text_widget.dart';
import 'package:e_commerce/features/home/controllers/payment_controller.dart';
import 'package:e_commerce/features/home/screens/web_view.dart';
import 'package:e_commerce/features/home/widgets/image_container.dart';
import 'package:e_commerce/features/home/widgets/rating_bar.dart';
import 'package:e_commerce/features/home/widgets/read_more_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.product,
    required this.email,
  });
  final dynamic product;
  final String email;
  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      crossAxisAlignment: CrossAxisAlignment.start,
      appBar: AppBar(
        title: boldText(
          text: product.productName,
        ),
      ),
      children: [
        ImageContainer(product: product),
        SizedBox(
          height: 25.h,
        ),
        boldText(
          text: product.productName,
          fontSize: 25.sp,
          fontWeight: FontWeight.w900,
        ),
        SizedBox(
          height: 5.h,
        ),
        RatingBarWidget(product: product),
        SizedBox(
          height: 10.h,
        ),
        boldText(text: "Size: ${product.size}"),
        SizedBox(
          height: 20.h,
        ),
        ReadMoreWidget(product: product),
        SizedBox(
          height: 40.h,
        ),
        PriceAndBuyRow(
          product: product,
          email: email,
        ),
        SizedBox(
          height: 25.h,
        ),
        // const CustomButton(buttonText: "Buy")
      ],
    );
  }
}

class PriceAndBuyRow extends StatelessWidget {
  const PriceAndBuyRow({
    super.key,
    required this.product,
    required this.email,
  });

  final dynamic product;
  final String email;
  @override
  Widget build(BuildContext context) {
    final p = Provider.of<PaymentController>(
      context,
      listen: false,
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        children: [
          boldText(
            text: "\$ ${product.price}.00",
            fontSize: 25.sp,
          ),
          SizedBox(
            width: 40.w,
          ),
         Expanded(
  child: CustomButton(
    onTap: () async {
      try {
        await p.initPayment(
          amount: product.price,
          email: email,
          context: context,
        );

        if (p.paymentData!.authorizationUrl.isNotEmpty) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>  WebViewScreen(paymentUrl: p.paymentData!.authorizationUrl,),
            ),
          );
        } else {
          showSnackBar(context, "Payment Error");
        }
      } catch (e) {
        showSnackBar(context, "An error occurred: ${e.toString()}");
      }
    },
    buttonText: "Buy",
    borderRadius: BorderRadius.circular(10.r),
  ),
)

        ],
      ),
    );
  }
}
