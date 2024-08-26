part of '../import_path/import_path.dart';

class Category {
  String? name;
  String? image;

  Category({
    this.name,
    this.image,
  });

  Category copyWith({
    String? name,
    String? image,
  }) {
    return Category(
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'image': image};
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      name: map['name'] != null ? map['name'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }
}
