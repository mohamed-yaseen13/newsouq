import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsouq/core/helpers/spacing.dart';
import 'package:newsouq/core/styles/app_colors.dart';
import 'package:newsouq/core/styles/app_text_styles.dart';
import 'package:newsouq/features/home/presentation/widgets/rating_display.dart';

class ProductCard extends StatelessWidget {
  // HomeProductEntity or SearchProductEntity
  final dynamic product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
              height: 190,
            ),
          ),
        ),
        Text(
          product.name,
          style: AppTextStyles.blackColor16FontSizeMedium,
          maxLines: 1,
        ),
        verticalSpace(4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${product.price.toStringAsFixed(2)} EGP',
              style: AppTextStyles.gray5Color16FontSizeRegular,
            ),
            horizontalSpace(8),
            if (product.discountPercentage > 0.0)
              Text(
                '-${product.discountPercentage}%',
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
        verticalSpace(4),
        RatingDisplay(rating: 4.5, ratingCount: 125),
      ],
    );
  }
}
