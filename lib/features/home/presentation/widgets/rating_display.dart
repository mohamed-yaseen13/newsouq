// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingDisplay extends StatelessWidget {
  final double rating;
  final int ratingCount;

  const RatingDisplay({
    super.key,
    required this.rating,
    required this.ratingCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$ratingCount',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(width: 4),
        RatingBarIndicator(
          rating: rating,
          itemBuilder: (context, index) =>
              const Icon(Icons.star, color: Colors.orange),
          itemCount: 5,
          itemSize: 18, // Adjust size here
          unratedColor: Colors.orange.withOpacity(0.3),
          direction: Axis.horizontal,
        ),
      ],
    );
  }
}
