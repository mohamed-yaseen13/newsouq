import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsouq/core/api/api_result.dart';
import 'package:newsouq/features/home/data/repos/home_repo_imp.dart';
import 'package:newsouq/features/home/domain/entities/home_product_entity.dart';
import 'package:newsouq/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepoImp homeRepoImp;

  HomeCubit({required this.homeRepoImp}) : super(HomeInitial());

  void getCategories() async {
    emit(GetCategoriesLoading());

    final response = await homeRepoImp.getCategories();

    if (response is Success<List<String>>) {
      emit(GetCategoriesSuccess(catogeriesnames: response.data));
    } else if (response is Failure<List<String>>) {
      emit(GetCategoriesError(apiErrorModel: response.apiErrorModel));
    }
  }

  void getProducts() async {
    emit(GetProductsLoading());

    final response = await homeRepoImp.getProducts();

    if (response is Success<List<HomeProductEntity>>) {
      emit(
        GetProductsSuccess(
          homeProducts: response.data,
          hasMore: response.hasMore,
        ),
      );
    } else if (response is Failure<List<HomeProductEntity>>) {
      emit(GetProductsError(apiErrorModel: response.apiErrorModel));
    }
  }

  bool _isLoadingMore = false;

  void getMoreProducts() async {
    if (_isLoadingMore) return;
    _isLoadingMore = true;

    final currentState = state;
    List<HomeProductEntity> currentProducts = [];

    if (currentState is GetProductsSuccess) {
      currentProducts = List.from(currentState.homeProducts);
    }

    final response = await homeRepoImp.getMoreProducts();

    if (response is Success<List<HomeProductEntity>>) {
      emit(
        GetProductsSuccess(
          homeProducts: currentProducts + response.data,
          hasMore: response.hasMore,
        ),
      );
    } else if (response is Failure<List<HomeProductEntity>>) {
      emit(GetProductsError(apiErrorModel: response.apiErrorModel));
    }
    _isLoadingMore = false;
  }

  void getProductsFromCategory(List<String> selectedCategories) async {
    emit(GetProductsLoading());

    final response = await homeRepoImp.getProductsFromCategory(
      selectedCategories,
    );

    if (response is Success<List<HomeProductEntity>>) {
      emit(
        GetProductsSuccess(
          homeProducts: response.data,
          hasMore: response.hasMore,
        ),
      );
    } else if (response is Failure<List<HomeProductEntity>>) {
      emit(GetProductsError(apiErrorModel: response.apiErrorModel));
    }
  }

  void getSearchedProducts(String searchingText) async {
    emit(GetSearchedProductsLoading());

    final response = await homeRepoImp.getSearchedProducts(searchingText);

    if (response is Success<List<HomeProductEntity>>) {
      emit(GetSearchedProductsSuccess(homeProducts: response.data));
    } else if (response is Failure<List<HomeProductEntity>>) {
      emit(GetSearchedProductsError(apiErrorModel: response.apiErrorModel));
    }
  }
}
