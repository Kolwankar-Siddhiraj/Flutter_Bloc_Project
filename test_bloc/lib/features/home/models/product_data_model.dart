// ignore_for_file: depend_on_referenced_packages

import 'package:collection/collection.dart';

class ProductDataModel {
  int? id;
  String? name;
  double? price;
  String? description;
  String? imgUrl;

  ProductDataModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.imgUrl,
  });

  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDataModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'] as String?,
      imgUrl: json['img_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'description': description,
        'img_url': imgUrl,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ProductDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      price.hashCode ^
      description.hashCode ^
      imgUrl.hashCode;
}
