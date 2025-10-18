import 'package:flutter/foundation.dart';
import 'package:newsouq/core/api/api_error_handler.dart';
import 'package:newsouq/core/api/api_result.dart';
import 'package:newsouq/features/home/data/apis/home_api_service.dart';
import 'package:newsouq/features/home/data/mappers/home_products_mapper.dart';
import 'package:newsouq/features/home/domain/entities/home_product_entity.dart';
import 'package:newsouq/features/home/data/models/products_response_model.dart';

class HomeRepoImp {
  final HomeApiService homeApiService;

  HomeRepoImp({required this.homeApiService});

  Future<ApiResult<List<String>>> getCategories() async {
    try {
      List<String> catogeries = await homeApiService.getCategories();

      return ApiResult.success(catogeries);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<HomeProductEntity>>> getProducts() async {
    try {
      ProductsResponseModel productsResponseModel = await homeApiService
          .getProducts();

      List<HomeProductEntity> productsEntity = productsResponseModel.products
          .map((product) => HomeProductsMapper.toProductEntity(product))
          .toList();

      return ApiResult.success(
        productsEntity,
        hasMore: productsResponseModel.hasMore,
      );
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<HomeProductEntity>>> getMoreProducts() async {
    try {
      ProductsResponseModel productsResponseModel = await homeApiService
          .getMoreProducts();

      List<HomeProductEntity> productsEntity = productsResponseModel.products
          .map((product) => HomeProductsMapper.toProductEntity(product))
          .toList();

      return ApiResult.success(
        productsEntity,
        hasMore: productsResponseModel.hasMore,
      );
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<HomeProductEntity>>> getProductsFromCategory(
    List<String> selectedCategories,
  ) async {
    if (kDebugMode) {
      print('🌀 [HomeRepoImp] Selected categories: $selectedCategories');
    }

    List<HomeProductEntity> productsFromSelectedCategories = [];
    try {
      for (String categoryName in selectedCategories) {
        if (kDebugMode) {
          print('🔸 [HomeRepoImp] Fetching products for: $categoryName');
        }

        final ProductsResponseModel productsResponseModel = await homeApiService
            .getProductsFromCategory(categoryName);

        if (kDebugMode) {
          print(
            '🔸 [HomeRepoImp] Received ${productsResponseModel.products.length} products from $categoryName',
          );
        }

        List<HomeProductEntity> productsEntity = productsResponseModel.products
            .map((product) => HomeProductsMapper.toProductEntity(product))
            .toList();

        productsFromSelectedCategories += productsEntity;
      }
      if (kDebugMode) {
        print(
          '✅ [HomeRepoImp] Total combined products: ${productsFromSelectedCategories.length}',
        );
      }
      return ApiResult.success(productsFromSelectedCategories);
    } catch (error, stack) {
      if (kDebugMode) {
        print('❌ [HomeRepoImp] Error fetching products: $error');
        print(stack);
      }
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<HomeProductEntity>>> getSearchedProducts(
    String searchingText,
  ) async {
    if (searchingText.isEmpty) {
      return ApiResult.success([]);
    }
    try {
      ProductsResponseModel productsResponseModel = await homeApiService
          .getProducts();

      List<HomeProductEntity> productsEntity = productsResponseModel.products
          .map((product) => HomeProductsMapper.toProductEntity(product))
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
