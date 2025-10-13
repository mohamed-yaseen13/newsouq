import 'package:json_annotation/json_annotation.dart';

part 'new_product_model.g.dart';

@JsonSerializable()
class NewProductModel {
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

  NewProductModel({
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

  factory NewProductModel.fromJson(Map<String, dynamic> json) =>
      _$NewProductModelFromJson(json);

  NewProductModel copyWithId(String id) {
    return NewProductModel(
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
