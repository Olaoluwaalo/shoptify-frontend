import 'package:e_commerce/common/text_widget.dart';
import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/features/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    final categories = homeController.allCategories;

    if (homeController.isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: EColors.primaryColor,
        ),
      );
    }

    return SizedBox(
      height: 50.h,
      child: categories.isNotEmpty
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: categories.length + 1,
              itemBuilder: (context, index) {
                // Handle "All" button
                if (index == 0) {
                  final isSelected = homeController.selectedCategoryId == null;
                  return GestureDetector(
                    onTap: () {
                      homeController.selectCategory(null);// Select "All"
                      homeController.fetchAllSubcategories(
                        context: context,
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.w,
                        vertical: 15.h,
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:
                              isSelected ? EColors.primaryColor : Colors.grey,
                          width: isSelected ? 3.w : 2.w,
                        ),
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      child: boldText(
                        text: "All",
                        fontSize: 15.sp,
                      ),
                    ),
                  );
                }

                // Handle categories
                final category = categories[index - 1];
                final isSelected =
                    homeController.selectedCategoryId == category.id;

                return GestureDetector(
                  onTap: () {
                    homeController.selectCategory(category.id);
                    homeController.fetchAllSubcategories(
                      context: context,
                      productId: category.id,
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.w,
                      vertical: 15.h,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected ? EColors.primaryColor : Colors.grey,
                        width: 2.w,
                      ),
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: boldText(
                      text: category.categoryName,
                      fontSize: 15.sp,
                    ),
                  ),
                );
              },
            )
          : Center(
              child: boldText(text: "No categories available"),
            ),
    );
  }
}
