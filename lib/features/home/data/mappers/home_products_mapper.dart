import 'package:newsouq/features/home/data/models/product_model.dart';
import 'package:newsouq/features/home/domain/entities/home_product_entity.dart';

class HomeProductsMapper {
  static HomeProductEntity toProductEntity(ProductModel product) {
    return HomeProductEntity(
      imageUrl: product.imagesUrl.first,
      name: product.name,
      price: product.sellingPrice,
      discountPercentage: product.discount,
      id: product.id!,
    );
  }
}
