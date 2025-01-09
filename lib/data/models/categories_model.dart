// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
    bool success;
    List<AllCategory> allCategories;

    Categories({
        required this.success,
        required this.allCategories,
    });

    factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        success: json["success"],
        allCategories: List<AllCategory>.from(json["allCategories"].map((x) => AllCategory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "allCategories": List<dynamic>.from(allCategories.map((x) => x.toJson())),
    };
}

class AllCategory {
    String id;
    String categoryName;
    int v;

    AllCategory({
        required this.id,
        required this.categoryName,
        required this.v,
    });

    factory AllCategory.fromJson(Map<String, dynamic> json) => AllCategory(
        id: json["_id"],
        categoryName: json["categoryName"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "categoryName": categoryName,
        "__v": v,
    };
}
