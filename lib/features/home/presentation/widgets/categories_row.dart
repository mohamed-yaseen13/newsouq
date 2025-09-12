import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsouq/core/styles/app_colors.dart';
import 'package:newsouq/core/styles/app_text_styles.dart';
import 'package:newsouq/features/home/presentation/cubit/home_cubit.dart';
import 'package:newsouq/features/home/presentation/cubit/home_state.dart';

class CategoriesRow extends StatefulWidget {
  final GetCategoriesSuccess state;

  const CategoriesRow({super.key, required this.state});

  @override
  State<CategoriesRow> createState() => _CategoriesRowState();
}

class _CategoriesRowState extends State<CategoriesRow> {
  List<String> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.state.catogeriesnames.map((name) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (selectedCategories.contains(name.toLowerCase())) {
                    selectedCategories.remove(name.toLowerCase());
                  } else {
                    selectedCategories.add(name.toLowerCase());
                  }
                });
                if (selectedCategories.isEmpty) {
                  context.read<HomeCubit>().getProducts();
                } else {
                  context.read<HomeCubit>().getProductsFromCategory(
                    selectedCategories,
                  );
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: selectedCategories.contains(name.toLowerCase())
                      ? AppColors.black
                      : Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColors.gray1),
                ),
                child: Text(
                  name,
                  style: selectedCategories.contains(name.toLowerCase())
                      ? AppTextStyles.whiteColor16FontSizeMedium
                      : AppTextStyles.blackColor16FontSizeMedium,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
