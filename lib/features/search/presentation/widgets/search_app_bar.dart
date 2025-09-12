import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsouq/core/helpers/extension.dart';
import 'package:newsouq/core/routing/app_routes.dart';
import 'package:newsouq/core/styles/app_text_styles.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            context.pop();
          },
          child: SvgPicture.asset('assets/icons/Arrow.svg'),
        ),
        Text('Search', style: AppTextStyles.blackColor32FontSizeSemibold),
        InkWell(
          onTap: () => context.pushNamed(AppRoutes.notificationsScreen),
          child: SvgPicture.asset('assets/icons/Bell.svg'),
        ),
      ],
    );
  }
}
