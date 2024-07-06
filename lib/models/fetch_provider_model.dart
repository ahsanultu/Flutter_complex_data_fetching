import 'dart:convert';

List<FetchProviderModel> categoryFromJson(String str) =>
    List<FetchProviderModel>.from(
        json.decode(str)["data"].map((x) => FetchProviderModel.fromJson(x)));

class FetchProviderModel {
  FetchProviderModel({
    required this.id,
    required this.parentId,
    required this.name,
    required this.slug,
    this.description,
    required this.position,
    required this.image,
    required this.children,
    required this.products,
  });

  final int id;
  final int? parentId;
  final String name;
  final String slug;
  final dynamic description;
  final int position;
  final String image;
  final List<ChildCategory> children;
  final List<Product> products;

  factory FetchProviderModel.fromJson(Map<String, dynamic> json) =>
      FetchProviderModel(
        id: json["id"],
        parentId: json["parentId"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        position: json["position"],
        image: json["image"],
        children: List<ChildCategory>.from(
            json["children"].map((x) => ChildCategory.fromJson(x))),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );
}

class ChildCategory {
  ChildCategory({
    required this.id,
    required this.parentId,
    required this.name,
    required this.slug,
    this.description,
    required this.position,
    required this.image,
    required this.products,
  });

  final int id;
  final int parentId;
  final String name;
  final String slug;
  final dynamic description;
  final int position;
  final String image;
  final List<Product> products;

  factory ChildCategory.fromJson(Map<String, dynamic> json) => ChildCategory(
        id: json["id"],
        parentId: json["parentId"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        position: json["position"],
        image: json["image"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.slug,
    this.image,
  });

  final int id;
  final String name;
  final String slug;
  final String? image;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
      );
}
