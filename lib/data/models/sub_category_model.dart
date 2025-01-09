// To parse this JSON data, do
//
//     final subCategories = subCategoriesFromJson(jsonString);

import 'dart:convert';

SubCategories subCategoriesFromJson(String str) => SubCategories.fromJson(json.decode(str));

String subCategoriesToJson(SubCategories data) => json.encode(data.toJson());

class SubCategories {
    bool success;
    List<AllSubCategory> allSubCategory;

    SubCategories({
        required this.success,
        required this.allSubCategory,
    });

    factory SubCategories.fromJson(Map<String, dynamic> json) => SubCategories(
        success: json["success"],
        allSubCategory: List<AllSubCategory>.from(json["allSubCategory"].map((x) => AllSubCategory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "allSubCategory": List<dynamic>.from(allSubCategory.map((x) => x.toJson())),
    };
}

class AllSubCategory {
    String id;
    String productId;
    String productName;
    String productImage;
    int price;
    int review;
    String size;
    String description;
    int rating;
    int v;

    AllSubCategory({
        required this.id,
        required this.productId,
        required this.productName,
        required this.productImage,
        required this.price,
        required this.review,
        required this.size,
        required this.description,
        required this.rating,
        required this.v,
    });

    factory AllSubCategory.fromJson(Map<String, dynamic> json) => AllSubCategory(
        id: json["_id"],
        productId: json["productId"],
        productName: json["productName"],
        productImage: json["productImage"],
        price: json["price"],
        review: json["review"],
        size: json["size"],
        description: json["description"],
        rating: json["rating"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "productId": productId,
        "productName": productName,
        "productImage": productImage,
        "price": price,
        "review": review,
        "size": size,
        "description": description,
        "rating": rating,
        "__v": v,
    };
}
