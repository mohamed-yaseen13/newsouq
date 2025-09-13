import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeSearchLoadingState extends StatelessWidget {
  const HomeSearchLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    final placeholders = List.generate(4, (index) => index);

    return SizedBox(
      height: 300.h,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: placeholders.length,
        separatorBuilder: (_, __) => Divider(height: 1.h),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: ListTile(
              title: Container(
                height: 14.h,
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 4.h),
                color: Colors.white,
              ),
              subtitle: Container(
                height: 12.h,
                width: 60.w,
                margin: EdgeInsets.symmetric(vertical: 4.h),
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
