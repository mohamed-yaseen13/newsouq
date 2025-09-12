import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsouq/core/styles/app_colors.dart';
import 'package:newsouq/core/styles/app_text_styles.dart';
import 'package:newsouq/features/home/presentation/cubit/home_cubit.dart';

class AppSearchBar extends StatelessWidget {
  final LayerLink layerLink;
  final FocusNode focusNode;
  final TextEditingController controller;
  final VoidCallback showOverlay;

  const AppSearchBar({
    super.key,
    required this.layerLink,
    required this.focusNode,
    required this.controller,
    required this.showOverlay,
  });

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: Container(
        width: 280.w,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.gray1),
        ),
        child: TextField(
          focusNode: focusNode,
          controller: controller,
          onChanged: (query) {
            context.read<HomeCubit>().getSearchedProducts(query);
            showOverlay();
          },
          decoration: InputDecoration(
            icon: SvgPicture.asset('assets/icons/Search.svg'),
            hintText: 'Search',
            hintStyle: AppTextStyles.gray4Color16FontSizeRegular,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
