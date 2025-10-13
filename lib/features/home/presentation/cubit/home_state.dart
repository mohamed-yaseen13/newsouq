import 'package:newsouq/core/api/api_error_model.dart';
import 'package:newsouq/features/home/domain/entities/home_product_entity.dart';

sealed class HomeState {}

class HomeInitial extends HomeState {}

// categories
class GetCategoriesLoading extends HomeState {}

class GetCategoriesSuccess extends HomeState {
  final List<String> catogeriesnames;

  GetCategoriesSuccess({required this.catogeriesnames});
}

class GetCategoriesError extends HomeState {
  final ApiErrorModel apiErrorModel;

  GetCategoriesError({required this.apiErrorModel});
}

// products
class GetProductsLoading extends HomeState {}

class GetProductsSuccess extends HomeState {
  final List<HomeProductEntity> homeProducts;
  final bool hasMore;

  GetProductsSuccess({required this.homeProducts, required this.hasMore});
}

class GetProductsError extends HomeState {
  final ApiErrorModel apiErrorModel;

  GetProductsError({required this.apiErrorModel});
}

// search on products
class GetSearchedProductsLoading extends HomeState {}

class GetSearchedProductsSuccess extends HomeState {
  final List<HomeProductEntity> homeProducts;

  GetSearchedProductsSuccess({required this.homeProducts});
}

class GetSearchedProductsError extends HomeState {
  final ApiErrorModel apiErrorModel;

  GetSearchedProductsError({required this.apiErrorModel});
}
