import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsouq/features/home/presentation/cubit/home_cubit.dart';
import 'package:newsouq/features/home/presentation/cubit/home_state.dart';
import 'package:newsouq/features/home/presentation/widgets/products_column.dart';
import 'package:newsouq/features/home/presentation/widgets/products_loading.dart';

class ProductsBuilder extends StatelessWidget {
  const ProductsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is GetProductsLoading ||
          current is GetProductsError ||
          current is GetProductsSuccess,
      builder: (context, state) {
        switch (state) {
          case GetProductsLoading _:
            return const ProductsLoading();

          case GetProductsError _:
            return Center(child: Text(state.apiErrorModel.message!));

          case GetProductsSuccess _:
            return ProductsColumn(state: state);

          default:
            return const ProductsLoading();
        }
      },
    );
  }
}
