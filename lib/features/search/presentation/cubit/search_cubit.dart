import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsouq/core/api/api_result.dart';
import 'package:newsouq/features/home/domain/entities/home_product_entity.dart';
import 'package:newsouq/features/search/data/repos/search_repo_imp.dart';
import 'package:newsouq/features/search/presentation/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepoImp searchRepoImp;

  SearchCubit({required this.searchRepoImp}) : super(SearchInitial());

  void getSearchedProducts(String searchingText) async {
    emit(GetSearchedProductsLoading());

    final response = await searchRepoImp.getSearchedProducts(searchingText);

    if (response is Success<List<HomeProductEntity>> &&
        searchingText.isNotEmpty &&
        response.data.isEmpty) {
      emit(GetSearchedProductsNoResut());
    } else if (response is Success<List<HomeProductEntity>>) {
      emit(GetSearchedProductsSuccess(homeProducts: response.data));
    } else if (response is Failure<List<HomeProductEntity>>) {
      emit(GetSearchedProductsError(apiErrorModel: response.apiErrorModel));
    }
  }
}
