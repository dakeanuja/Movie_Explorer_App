import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final int starCount;
  final double size;

  StarRating({required this.rating, this.starCount = 5, this.size = 24.0});

  @override
  Widget build(BuildContext context) {
    int filledStars = (rating / 2).round();

    return Row(
      children: List.generate(starCount, (index) {
        return Icon(
          index < filledStars ? Icons.star : Icons.star_border,
          color: Colors.yellow,
          size: size,
        );
      }),
    );
  }
}
