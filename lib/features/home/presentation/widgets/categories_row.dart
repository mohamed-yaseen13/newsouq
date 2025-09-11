import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsouq/core/styles/app_colors.dart';
import 'package:newsouq/core/styles/app_text_styles.dart';
import 'package:newsouq/features/home/presentation/cubit/home_state.dart';

class CategoriesRow extends StatelessWidget {
  final GetCategoriesSuccess state;

  const CategoriesRow({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: state.catogeriesnames.map((name) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: GestureDetector(
              onTap: () {
                // Handle tap, e.g. set selected category
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColors.gray1),
                ),
                child: Text(
                  name,
                  style: AppTextStyles.blackColor16FontSizeMedium,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
