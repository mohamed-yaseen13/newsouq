import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsouq/features/home/presentation/cubit/home_cubit.dart';
import 'package:newsouq/features/home/presentation/cubit/home_state.dart';
import 'package:newsouq/features/home/presentation/widgets/home_search_loading_state.dart';
import 'package:newsouq/features/home/presentation/widgets/home_search_success_state.dart';

class SearchResultContainer extends StatelessWidget {
  const SearchResultContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.black,
      color: Colors.white,
      elevation: 4,
      borderRadius: BorderRadius.circular(8.r),
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is GetSearchedProductsSuccess ||
            current is GetSearchedProductsLoading,
        builder: (context, state) {
          switch (state) {
            case GetSearchedProductsLoading _:
              return HomeSearchLoadingState();
            case GetSearchedProductsSuccess _:
              return HomeSearchSuccessState(state: state);
            default:
              return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
