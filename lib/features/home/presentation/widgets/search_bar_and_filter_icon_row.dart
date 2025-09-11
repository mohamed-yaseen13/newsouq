import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsouq/core/styles/app_colors.dart';
import 'package:newsouq/core/styles/app_text_styles.dart';

class SearchBarAndFilterIconRow extends StatelessWidget {
  const SearchBarAndFilterIconRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: 280.w,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.gray1),
              ),
              child: TextField(
                decoration: InputDecoration(
                  icon: SvgPicture.asset('assets/icons/Search.svg'),
                  hintText: 'Search',
                  hintStyle: AppTextStyles.gray4Color16FontSizeRegular,
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
        Spacer(),
        SvgPicture.asset('assets/icons/Button.svg'),
      ],
    );
  }
}
