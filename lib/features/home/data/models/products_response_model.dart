import 'package:json_annotation/json_annotation.dart';
import 'package:newsouq/features/home/data/models/product_model.dart';

part 'products_response_model.g.dart';

@JsonSerializable()
class ProductsResponseModel {
  List<ProductModel> products;
  int total;
  int skip;
  int limit;

  ProductsResponseModel({
    required this.limit,
    required this.products,
    required this.skip,
    required this.total,
  });

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseModelFromJson(json);
}
