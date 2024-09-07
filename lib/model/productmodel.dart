part of '../import_path/import_path.dart';

class Productmodel {
  String? productId;
  String name;
  String image;
  num? price;
  num? oldPrice;
  bool? isavaible;
  String? description;
  String? categoryName;

  Productmodel(
      {required this.categoryName,
      required this.name,
      required this.image,
      required this.price,
      this.isavaible,
      required this.oldPrice,
      this.description,
      required this.productId});

  Productmodel copyWith({
    String? productId,
    String? name,
    String? image,
    num? price,
    num? oldPrice,
    bool? isavaible,
    String? description,
    String? categoryName,
  }) {
    return Productmodel(
        name: name ?? this.name,
        image: image ?? this.image,
        price: price ?? this.price,
        oldPrice: oldPrice ?? this.oldPrice,
        productId: productId ?? this.productId,
        categoryName: categoryName ?? this.categoryName,
        description: description ?? this.description,
        isavaible: isavaible ?? this.isavaible);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'price': price,
      'oldPrice': oldPrice,
      'productId': productId,
      'categoryname': categoryName,
      'description': description,
      'isavaible': isavaible
    };
  }

  factory Productmodel.fromMap(Map<String, dynamic> map) {
    return Productmodel(
      name: map['name'],
      // as String,
      image: map['image'],
      price: map["price"],
      oldPrice: map['oldPrice'],
      productId: map['productId'],
      categoryName: map['categoryName'],
      description: map['description'],
      isavaible: map['isavaible'],
    );
  }
}
