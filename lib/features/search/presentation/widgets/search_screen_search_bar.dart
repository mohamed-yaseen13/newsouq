import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsouq/core/styles/app_colors.dart';
import 'package:newsouq/core/styles/app_text_styles.dart';
import 'package:newsouq/features/search/presentation/cubit/search_cubit.dart';

class SearchScreenSearchBar extends StatefulWidget {
  const SearchScreenSearchBar({super.key});

  @override
  State<SearchScreenSearchBar> createState() => _SearchScreenSearchBarState();
}

class _SearchScreenSearchBarState extends State<SearchScreenSearchBar> {
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.gray1),
      ),
      child: TextField(
        onChanged: (query) {
          context.read<SearchCubit>().getSearchedProducts(query);
          setState(() {
            isSearching = query.isNotEmpty;
          });
        },
        decoration: InputDecoration(
          icon: SvgPicture.asset(
            isSearching
                ? 'assets/icons/Search_selected.svg'
                : 'assets/icons/Search.svg',
          ),
          hintText: 'Search',
          hintStyle: AppTextStyles.gray4Color16FontSizeRegular,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
