import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsouq/features/home/presentation/cubit/home_state.dart';
import 'package:newsouq/features/home/presentation/widgets/product_card.dart';

class ProductsColumn extends StatelessWidget {
  final GetProductsSuccess state;

  const ProductsColumn({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(12.r),
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2 / 2.7,
      ),
      itemCount: state.homeProducts.length,
      itemBuilder: (context, index) {
        final product = state.homeProducts[index];
        return ProductCard(product: product);
      },
    );
  }
}
