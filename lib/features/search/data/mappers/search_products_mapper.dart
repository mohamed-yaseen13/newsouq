import 'package:newsouq/features/home/data/models/product_model.dart';
import 'package:newsouq/features/search/domain/entities/search_product_entity.dart';

class SearchProductsMapper {
  static SearchProductEntity toProductEntity(ProductModel product) {
    return SearchProductEntity(
      imageUrl: product.imagesUrl.first,
      name: product.name,
      price: product.sellingPrice,
      discountPercentage: product.discount,
      id: product.id!,
    );
  }
}
