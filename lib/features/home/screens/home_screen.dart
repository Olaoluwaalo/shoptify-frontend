import 'package:e_commerce/common/generic_scaffold.dart';
import 'package:e_commerce/common/search_text_field.dart';
import 'package:e_commerce/common/text_widget.dart';
import 'package:e_commerce/features/home/controllers/home_controller.dart';
import 'package:e_commerce/features/home/widgets/categories_widget.dart';
import 'package:e_commerce/features/home/widgets/popular_products.dart';
import 'package:e_commerce/features/home/widgets/profile_row.dart';
import 'package:e_commerce/features/home/widgets/sub_categories_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.token,
  });
  final String token;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  String? email;
  String? name;

  @override
  void initState() {
    super.initState();
    final Map<String, dynamic> jwtDecoded = JwtDecoder.decode(widget.token);
    email = jwtDecoded["email"];
    name = jwtDecoded["name"];
    getData();
  }

  void getData() async {
    final homeController = Provider.of<HomeController>(context, listen: false);
    await homeController.getProducts(context);
    await homeController.getAllCategories(context);
    await homeController.fetchAllSubcategories(
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileRow(
            name: name!,
          ),
          SizedBox(
            height: 25.h,
          ),
          boldText(
            text: "What are you buying today",
            fontSize: 20.sp,
          ),
          SizedBox(
            height: 10.h,
          ),
          const SearchTextField(),
          SizedBox(
            height: 15.h,
          ),
          boldText(
            text: "Popular products",
            fontSize: 18.sp,
          ),
          Consumer<HomeController>(
            builder: (context, value, child) {
              return  PopularProductsWidget(email: email!,);
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          boldText(text: "Categories"),
          SizedBox(
            height: 10.h,
          ),
          Consumer<HomeController>(
            builder: (context, value, child) {
              return GestureDetector(
                  onTap: () {
                    value.getAllCategories(context);
                  },
                  child: Column(
                    children: [
                      const CategoriesWidget(),
                      SizedBox(
                        height: 15.h,
                      ),
                       SubCategoriesWidget(email: email!,),
                    ],
                  ));
            },
          ),
        ]);
  }
}
