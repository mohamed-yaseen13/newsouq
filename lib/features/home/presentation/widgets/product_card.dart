import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsouq/core/helpers/spacing.dart';
import 'package:newsouq/core/styles/app_colors.dart';
import 'package:newsouq/core/styles/app_text_styles.dart';
import 'package:newsouq/features/home/domain/entities/home_product_entity.dart';

class ProductCard extends StatelessWidget {
  final HomeProductEntity product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          color: AppColors.gray1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: ClipRRect(
            child: Image.network(
              product.imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          product.name,
          style: AppTextStyles.blackColor16FontSizeMedium,
          maxLines: 1,
        ),
        verticalSpace(4),
        Text(
          '\$${product.price}',
          style: AppTextStyles.gray5Color16FontSizeRegular,
        ),
      ],
    );
  }
}
