import 'package:newsouq/core/api/api_error_handler.dart';
import 'package:newsouq/core/api/api_result.dart';
import 'package:newsouq/features/home/data/models/products_response_model.dart';
import 'package:newsouq/features/search/data/apis/search_api_service.dart';
import 'package:newsouq/features/search/data/mappers/search_products_mapper.dart';
import 'package:newsouq/features/search/domain/entities/search_product_entity.dart';

class SearchRepoImp {
  final SearchApiService searchApiService;

  SearchRepoImp({required this.searchApiService});

  Future<ApiResult<List<SearchProductEntity>>> getSearchedProducts(
    String searchingText,
  ) async {
    if (searchingText.isEmpty) {
      return ApiResult.success([]);
    }
    try {
      ProductsResponseModel productsResponseModel = await searchApiService
          .getProducts();

      List<SearchProductEntity> productsEntity = productsResponseModel.products
          .map((product) => SearchProductsMapper.toProductEntity(product))
          .toList();

      productsEntity = productsEntity.where((product) {
        final name = product.name.toLowerCase();
        final searchWords = searchingText.toLowerCase().trim().split(
          RegExp(r'\s+'),
        );
        return searchWords.every((word) => name.contains(word));
      }).toList();

      return ApiResult.success(productsEntity);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
