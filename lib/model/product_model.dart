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
  String name;
  String details;
  String price;
  String contactNumber;
  String email;
  List<String> image;
  bool isFavourite;
  String id;

  ProductDataList({
    required this.contactNumber,
    required this.details,
    required this.email,
    required this.name,
    required this.price,
    required this.image,
    required this.isFavourite,
    required this.id,
  });

  factory ProductDataList.fromJson(Map<String, dynamic> json) =>
      ProductDataList(
        name: json["name"],
        email: json["email"],
        details: json["details"],
        contactNumber: json["contactNumber"],
        price: json["price"],
        id: json["id"],
        isFavourite: json["isFavourite"],
        image: List<String>.from(json["image"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "details": details,
        "contactNumber": contactNumber,
        "price": price,
        "id": id,
        "isFavourite": isFavourite,
        "image": List<dynamic>.from(image.map((x) => x)),
      };
}
