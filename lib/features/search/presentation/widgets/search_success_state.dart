import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsouq/features/home/presentation/widgets/product_card.dart';
import 'package:newsouq/features/search/presentation/cubit/search_state.dart';

class SearchSuccessState extends StatelessWidget {
  final GetSearchedProductsSuccess state;

  const SearchSuccessState({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(12.r),
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2 / 1.8,
      ),
      itemCount: state.searchProducts.length,
      itemBuilder: (context, index) {
        final product = state.searchProducts[index];
        return InkWell(
          onTap: () {},
          child: ProductCard(product: product),
        );
      },
    );
  }
}
