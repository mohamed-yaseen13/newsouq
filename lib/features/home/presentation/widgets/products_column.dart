import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsouq/features/home/presentation/cubit/home_cubit.dart';
import 'package:newsouq/features/home/presentation/cubit/home_state.dart';
import 'package:newsouq/features/home/presentation/widgets/loading_product.dart';
import 'package:newsouq/features/home/presentation/widgets/product_card.dart';

class ProductsColumn extends StatefulWidget {
  final GetProductsSuccess state;

  const ProductsColumn({super.key, required this.state});

  @override
  State<ProductsColumn> createState() => _ProductsColumnState();
}

class _ProductsColumnState extends State<ProductsColumn> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (widget.state.hasMore) {
          context.read<HomeCubit>().getMoreProducts();
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      padding: EdgeInsets.all(12.r),
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2 / 3.2,
      ),
      itemCount: widget.state.hasMore
          ? widget.state.homeProducts.length +
                1 // show loader
          : widget.state.homeProducts.length,
      itemBuilder: (context, index) {
        if (index < widget.state.homeProducts.length) {
          final product = widget.state.homeProducts[index];
          return ProductCard(product: product);
        } else {
          return LoadingProduct();
        }
      },
    );
  }
}
