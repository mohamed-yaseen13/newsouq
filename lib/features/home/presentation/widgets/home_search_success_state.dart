import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsouq/features/home/presentation/cubit/home_state.dart';

class HomeSearchSuccessState extends StatelessWidget {
  final GetSearchedProductsSuccess state;

  const HomeSearchSuccessState({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
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
          subtitle: Text(
            "\$${state.homeProducts[i].price.toStringAsFixed(2)} EGP",
          ),
        ),
      ),
    );
  }
}
