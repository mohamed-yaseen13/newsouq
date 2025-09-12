import 'package:flutter/material.dart';
import 'package:newsouq/core/styles/app_text_styles.dart';

class SearchDefaultState extends StatelessWidget {
  const SearchDefaultState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Recent Searches',
              style: AppTextStyles.blackColor20FontSizeSemibold,
            ),
            Spacer(),
            InkWell(
              onTap: () {},
              child: Text(
                'Clear all',
                style: AppTextStyles.blackColor16FontSizeMediumUnderline,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
