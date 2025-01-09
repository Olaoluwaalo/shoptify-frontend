import 'dart:developer';

import 'package:e_commerce/data/models/categories_model.dart';
import 'package:e_commerce/data/models/popular_products.dart';
import 'package:e_commerce/data/models/sub_category_model.dart';
import 'package:e_commerce/data/repositories/categories_repo.dart';
import 'package:e_commerce/data/repositories/pp_repo.dart';
import 'package:e_commerce/data/repositories/sub_category_repo.dart';
import 'package:flutter/material.dart';

class HomeController with ChangeNotifier {
  List<PopularProduct> _allProducts = [];
  List<PopularProduct> get allProducts => _allProducts;
  List<AllCategory> _allCategories = [];
  List<AllCategory> get allCategories => _allCategories;
  final CategoriesRepo _categoriesRepo = CategoriesRepo();
  final PpRepo _ppRepo = PpRepo();
  final SubCategoryRepo _subCategoryRepo = SubCategoryRepo();
  List<AllSubCategory> _subCategories = [];
  List<AllSubCategory> get subCategories => _subCategories;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isPpLoading = false;
  bool get isPpLoading => _isPpLoading;
  bool _isScLoading = false;
  bool get isScLoading => _isScLoading;
  Future<void> getAllCategories(BuildContext context) async {
    try {
      _isLoading = true;
      final ac = await _categoriesRepo.getAllCategories(context);
      _allCategories = ac!.allCategories;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return;
    }
  }

  Future<void> fetchAllSubcategories(
      {required BuildContext context, String? productId}) async {
    try {
      _isScLoading = true;
      final allSc = await _subCategoryRepo.getSubCategory(
        context: context,
        productId: productId,
      );
      _subCategories = allSc!.allSubCategory;
      log(allSc.allSubCategory[1].productName);
      _isScLoading = false;
      notifyListeners();
    } catch (e) {
      _isScLoading = false;
      notifyListeners();
      return;
    }
  }
   String? selectedCategoryId; 


  void selectCategory(String? categoryId) {
    selectedCategoryId = categoryId;
    notifyListeners();
  }

  Future<void> getProducts(BuildContext context) async {
    try {
       _isPpLoading = true;
      final pp = await _ppRepo.getAllProducts(context);
      _allProducts = pp!.popularProducts;
      _isPpLoading = false;
      notifyListeners();
   
    } catch (e) {
      _isPpLoading = false;
      notifyListeners();
      return;
    }
  }
}
