import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesLoading extends StatelessWidget {
  const CategoriesLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final placeholders = List.generate(5, (index) => index);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: placeholders.map((_) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: 90.w,
                height: 36.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
