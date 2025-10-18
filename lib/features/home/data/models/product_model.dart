import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  @JsonKey(includeFromJson: true)
  final String? id;

  final String category;
  final double costPrice;
  final String description;
  final double discount;
  final List<String> imagesUrl;
  final String name;
  final int quantity;
  final double sellingPrice;

  ProductModel({
    this.id,
    required this.category,
    required this.costPrice,
    required this.description,
    required this.discount,
    required this.imagesUrl,
    required this.name,
    required this.quantity,
    required this.sellingPrice,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$NewProductModelFromJson(json);

  ProductModel copyWithId(String id) {
    return ProductModel(
      id: id,
      category: category,
      costPrice: costPrice,
      description: description,
      discount: discount,
      imagesUrl: imagesUrl,
      name: name,
      quantity: quantity,
      sellingPrice: sellingPrice,
    );
  }
}
