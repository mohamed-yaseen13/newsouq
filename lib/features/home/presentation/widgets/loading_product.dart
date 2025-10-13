import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class LoadingProduct extends StatelessWidget {
  const LoadingProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image placeholder
            Container(
              height: 120.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
              ),
            ),
            SizedBox(height: 8.h),
            // Title placeholder
            Container(
              height: 14.h,
              width: 80.w,
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              color: Colors.white,
            ),
            SizedBox(height: 6.h),
            // Price placeholder
            Container(
              height: 14.h,
              width: 50.w,
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
