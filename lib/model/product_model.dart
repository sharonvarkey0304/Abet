import 'dart:convert';

ProductModel productDataModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productDataModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  List<ProductDataList>? productDataList;

  ProductModel({
    this.productDataList,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productDataList:
            json["product_list"] == null ? [] : List<ProductDataList>.from(
                // ignore: unnecessary_lambdas
                json["product_list"]!.map((x) => ProductDataList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product_list": productDataList == null
            ? []
            : List<dynamic>.from(productDataList!.map((x) => x.toJson())),
      };
}

class ProductDataList {
  final String name;
  final String details;
  final String price;
  final String contactNumber;
  final String email;
  final String? image;

  ProductDataList({
    required this.contactNumber,
    required this.details,
    required this.email,
    required this.name,
    required this.price,
    required this.image,
  });

  factory ProductDataList.fromJson(Map<String, dynamic> json) =>
      ProductDataList(
        name: json["name"],
        email: json["email"],
        details: json["details"],
        contactNumber: json["contactNumber"],
        price: json["price"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "details": details,
        "contactNumber": contactNumber,
        "price": price,
        "image": image,
      };
}
