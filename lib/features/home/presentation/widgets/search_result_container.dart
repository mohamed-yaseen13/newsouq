import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsouq/features/home/presentation/cubit/home_cubit.dart';
import 'package:newsouq/features/home/presentation/cubit/home_state.dart';

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
              return Container(
                padding: EdgeInsets.all(16.h),
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            case GetSearchedProductsSuccess _:
              if (state.homeProducts.isEmpty) {
                return const SizedBox.shrink();
              }
              return SizedBox(
                height: state.homeProducts.length >= 4
                    ? 300.h
                    : state.homeProducts.length * 75.h,
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: state.homeProducts.length,
                  separatorBuilder: (_, __) => Divider(height: 1.h),
                  itemBuilder: (_, i) => ListTile(
                    onTap: () {},
                    title: Text(state.homeProducts[i].name),
                    subtitle: Text("\$${state.homeProducts[i].price}"),
                  ),
                ),
              );
            default:
              return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
