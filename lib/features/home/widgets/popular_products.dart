import 'package:e_commerce/common/text_widget.dart';
import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/core/utils/helpers.dart';
import 'package:e_commerce/features/home/controllers/home_controller.dart';
import 'package:e_commerce/features/home/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PopularProductsWidget extends StatelessWidget {
  const PopularProductsWidget({
    super.key,
    required this.email,
  });
  final String email;
  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    final products = homeController.allProducts;
    if (homeController.isPpLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: EColors.primaryColor,
        ),
      );
    }
    return SizedBox(
      height: 260.h,
      child: products.isNotEmpty
          ? GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                final p = products[index];
                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5.h,
                    horizontal: 5.w,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          product: p,
                          email: email,
                        ),
                      ));
                    },
                    child: Container(
                      height: 60.h,
                      decoration: BoxDecoration(
                          color: EHelpers.isDarkMode(context)
                              ? Colors.grey.shade900
                              : const Color.fromARGB(255, 245, 245, 245),
                          borderRadius: BorderRadius.circular(
                            20.r,
                          )),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          boldText(
                            text: p.productName,
                            color: EHelpers.isDarkMode(context)
                                ? Colors.white60
                                : Colors.grey.shade900,
                            fontSize: 14.sp,
                          ),
                          Image.network(
                            p.productImage,
                            height: 25.h,
                          ),
                        ],
                      )),
                    ),
                  ),
                );
              },
            )
          : Center(
              child: boldText(
                text: "No product",
              ),
            ),
    );
  }
}
