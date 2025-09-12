import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsouq/core/helpers/spacing.dart';
import 'package:newsouq/core/styles/app_text_styles.dart';

class SearchNoResultState extends StatelessWidget {
  const SearchNoResultState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/icons/Search-duotone.svg'),
        verticalSpace(8),
        Text(
          'No Results Found!',
          style: AppTextStyles.blackColor20FontSizeSemibold,
          textAlign: TextAlign.center,
        ),
        verticalSpace(8),
        Text(
          'Try a similar word or something more general.',
          style: AppTextStyles.gray5Color16FontSizeRegular,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
