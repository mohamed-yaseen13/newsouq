import 'package:newsouq/core/api/api_error_handler.dart';
import 'package:newsouq/core/api/api_result.dart';
import 'package:newsouq/features/home/data/apis/home_api_service.dart';
import 'package:newsouq/features/home/data/mappers/products_mapper.dart';
import 'package:newsouq/features/home/data/models/category_model.dart';
import 'package:newsouq/features/home/domain/entities/home_product_entity.dart';
import 'package:newsouq/features/home/data/models/products_response_model.dart';

class HomeRepoImp {
  final HomeApiService homeApiService;

  HomeRepoImp({required this.homeApiService});

  Future<ApiResult<List<String>>> getCategories() async {
    try {
      List<CategoryModel> catogeries = await homeApiService.getCategories();

      List<String> catogeriesnames = catogeries
          .map((catogery) => catogery.name)
          .toList();

      return ApiResult.success(catogeriesnames);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<HomeProductEntity>>> getProducts() async {
    try {
      ProductsResponseModel productsResponseModel = await homeApiService
          .getProducts();

      List<HomeProductEntity> productsEntity = productsResponseModel.products
          .map((product) => ProductsMapper.toProductEntity(product))
          .toList();

      return ApiResult.success(productsEntity);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
