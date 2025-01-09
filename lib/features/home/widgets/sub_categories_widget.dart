import 'package:e_commerce/common/text_widget.dart';
import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/core/utils/helpers.dart';
import 'package:e_commerce/features/home/controllers/home_controller.dart';
import 'package:e_commerce/features/home/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SubCategoriesWidget extends StatelessWidget {
  const SubCategoriesWidget({
    super.key, required this.email,
  });
  final String email;
  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    final products = homeController.subCategories;
    if (homeController.isScLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: EColors.primaryColor,
        ),
      );
    }
    return SizedBox(
      child: products.isNotEmpty
          ? GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15.h,
                crossAxisSpacing: 15.w,
                childAspectRatio: (MediaQuery.of(context).size.width / 2) / 260,
              ),
              itemBuilder: (context, index) {
                final sc = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        product: sc,
                        email: email,
                      ),
                    ));
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 5.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: EHelpers.isDarkMode(context)
                            ? Colors.grey.shade700
                            : Colors.blueGrey.shade100,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          Center(
                            child: Image.network(
                              sc.productImage,
                              height: 180.h,
                            ),
                          ),
                        ],
                      )),
                );
              },
            )
          : Center(
              child: lightText(
                text: "No subCategory",
              ),
            ),
    );
  }
}
