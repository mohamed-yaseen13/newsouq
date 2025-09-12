import 'package:newsouq/core/api/api_error_model.dart';
import 'package:newsouq/features/home/domain/entities/home_product_entity.dart';

sealed class SearchState {}

class SearchInitial extends SearchState {}

class GetSearchedProductsLoading extends SearchState {}

class GetSearchedProductsSuccess extends SearchState {
  final List<HomeProductEntity> homeProducts;

  GetSearchedProductsSuccess({required this.homeProducts});
}

class GetSearchedProductsError extends SearchState {
  final ApiErrorModel apiErrorModel;

  GetSearchedProductsError({required this.apiErrorModel});
}

class GetSearchedProductsNoResut extends SearchState {}
