import 'package:json_annotation/json_annotation.dart';
import 'package:newsouq/features/home/data/models/product_model.dart';

part 'products_response_model.g.dart';

@JsonSerializable()
class ProductsResponseModel {
  final List<ProductModel> products;
  final bool hasMore;

  ProductsResponseModel({required this.products, required this.hasMore});

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseModelFromJson(json);
}
