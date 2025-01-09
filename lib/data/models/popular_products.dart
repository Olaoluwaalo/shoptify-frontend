// To parse this JSON data, do
//
//     final popularProducts = popularProductsFromJson(jsonString);

import 'dart:convert';

PopularProducts popularProductsFromJson(String str) => PopularProducts.fromJson(json.decode(str));

String popularProductsToJson(PopularProducts data) => json.encode(data.toJson());

class PopularProducts {
    List<PopularProduct> popularProducts;

    PopularProducts({
        required this.popularProducts,
    });

    factory PopularProducts.fromJson(Map<String, dynamic> json) => PopularProducts(
        popularProducts: List<PopularProduct>.from(json["popularProducts"].map((x) => PopularProduct.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "popularProducts": List<dynamic>.from(popularProducts.map((x) => x.toJson())),
    };
}

class PopularProduct {
    String id;
    String productName;
    String productImage;
    String description;
    int rating;
    int v;
    int? price;
    int? review;
    String? size;

    PopularProduct({
        required this.id,
        required this.productName,
        required this.productImage,
        required this.description,
        required this.rating,
        required this.v,
        this.price,
        this.review,
        this.size,
    });

    factory PopularProduct.fromJson(Map<String, dynamic> json) => PopularProduct(
        id: json["_id"],
        productName: json["productName"],
        productImage: json["productImage"],
        description: json["description"],
        rating: json["rating"],
        v: json["__v"],
        price: json["price"],
        review: json["review"],
        size: json["size"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "productName": productName,
        "productImage": productImage,
        "description": description,
        "rating": rating,
        "__v": v,
        "price": price,
        "review": review,
        "size": size,
    };
}
