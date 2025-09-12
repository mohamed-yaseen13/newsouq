import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsouq/core/helpers/extension.dart';
import 'package:newsouq/core/routing/app_routes.dart';
import 'package:newsouq/core/styles/app_text_styles.dart';

class AppNameAndNotificationIconRow extends StatelessWidget {
  const AppNameAndNotificationIconRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('New Souq', style: AppTextStyles.blackColor32FontSizeSemibold),
        Spacer(),
        InkWell(
          onTap: () => context.pushNamed(AppRoutes.notificationsScreen),
          child: SvgPicture.asset('assets/icons/Bell.svg'),
        ),
      ],
    );
  }
}
