import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsouq/core/constants/app_constants.dart';
import 'package:newsouq/core/helpers/spacing.dart';
import 'package:newsouq/core/widgets/app_navigation_bar.dart';
import 'package:newsouq/features/home/presentation/widgets/app_name_and_notification_icon_row.dart';
import 'package:newsouq/features/home/presentation/widgets/categories_builder.dart';
import 'package:newsouq/features/home/presentation/widgets/products_builder.dart';
import 'package:newsouq/features/home/presentation/widgets/search_bar_and_filter_icon_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppNavigationBar(
        selectedScreen: NavigationBarEnum.home,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 48.h, right: 18.w, left: 18.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppNameAndNotificationIconRow(),
              verticalSpace(12),
              SearchBarAndFilterIconRow(),
              verticalSpace(12),
              CategoriesBuilder(),
              verticalSpace(12),
              Expanded(child: ProductsBuilder()),
            ],
          ),
        ),
      ),
    );
  }
}
