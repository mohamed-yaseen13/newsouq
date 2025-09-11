import 'package:newsouq/features/home/data/models/product_model.dart';
import 'package:newsouq/features/home/domain/entities/home_product_entity.dart';

class ProductsMapper {
  static HomeProductEntity toProductEntity(ProductModel product) {
    return HomeProductEntity(
      imageUrl: product.images!.first,
      name: product.title!,
      price: product.price!,
      discountPercentage: product.discountPercentage!,
    );
  }
}
