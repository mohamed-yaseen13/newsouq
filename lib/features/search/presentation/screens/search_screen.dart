import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsouq/core/constants/app_constants.dart';
import 'package:newsouq/core/helpers/spacing.dart';
import 'package:newsouq/core/widgets/app_navigation_bar.dart';
import 'package:newsouq/features/search/presentation/widgets/search_app_bar.dart';
import 'package:newsouq/features/search/presentation/widgets/search_builder.dart';
import 'package:newsouq/features/search/presentation/widgets/search_screen_search_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppNavigationBar(
        selectedScreen: NavigationBarEnum.search,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 24.w),
          child: Column(
            children: [
              SearchAppBar(),
              verticalSpace(16),
              SearchScreenSearchBar(),
              verticalSpace(18),
              Expanded(child: SearchBuilder()),
            ],
          ),
        ),
      ),
    );
  }
}
