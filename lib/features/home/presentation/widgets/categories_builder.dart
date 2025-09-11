import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsouq/features/home/presentation/cubit/home_cubit.dart';
import 'package:newsouq/features/home/presentation/cubit/home_state.dart';
import 'package:newsouq/features/home/presentation/widgets/categories_row.dart';

class CategoriesBuilder extends StatelessWidget {
  const CategoriesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is GetCategoriesLoading ||
          current is GetCategoriesError ||
          current is GetCategoriesSuccess,
      builder: (context, state) {
        switch (state) {
          case GetCategoriesLoading _:
            return const Center(child: CircularProgressIndicator());

          case GetCategoriesError _:
            return Center(child: Text(state.apiErrorModel.message!));

          case GetCategoriesSuccess _:
            return CategoriesRow(state: state);

          default:
            return const Center(child: Text('no data'));
        }
      },
    );
  }
}
