part of '../import_path/import_path.dart';

class Productmodel {
  String? productImage;
  String? productName;
  double poductPrice;
  bool? isAvaible;
  String? productDescription;
  Productmodel(
      {this.isAvaible,
      required this.poductPrice,
      required this.productDescription,
      required this.productImage,
      required this.productName});
}
