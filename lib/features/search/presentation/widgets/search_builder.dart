import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsouq/features/search/presentation/cubit/search_cubit.dart';
import 'package:newsouq/features/search/presentation/cubit/search_state.dart';
import 'package:newsouq/features/search/presentation/widgets/search_default_state.dart';
import 'package:newsouq/features/search/presentation/widgets/search_no_result_state.dart';
import 'package:newsouq/features/search/presentation/widgets/search_success_state.dart';

class SearchBuilder extends StatelessWidget {
  const SearchBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (previous, current) =>
          current is GetSearchedProductsLoading ||
          current is GetSearchedProductsError ||
          current is GetSearchedProductsSuccess ||
          current is GetSearchedProductsNoResut,
      builder: (context, state) {
        switch (state) {
          case GetSearchedProductsLoading _:
            return const Center(child: CircularProgressIndicator());
          case GetSearchedProductsError _:
            return const Center(child: Text('Something went worng'));
          case GetSearchedProductsSuccess _:
            if (state.homeProducts.isEmpty) {
              return SearchDefaultState();
            }
            return SearchSuccessState(state: state);
          case GetSearchedProductsNoResut _:
            return SearchNoResultState();
          default:
            return SearchDefaultState();
        }
      },
    );
  }
}
