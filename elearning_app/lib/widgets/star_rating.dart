import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final Color? color;
  final int? ratingCount;

  const StarRating(
      {super.key,
      this.starCount = 5,
      this.rating = .0,
      this.color,
      this.ratingCount});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = const Icon(
        Icons.star_border,
        size: 14,
        color: Colors.yellow,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        size: 14,
        Icons.star_half,
        color: color ?? Theme.of(context).colorScheme.primary,
      );
    } else {
      icon = Icon(
        size: 14,
        Icons.star,
        color: color ?? Theme.of(context).colorScheme.primary,
      );
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ...List.generate(starCount, (index) => buildStar(context, index)),
      // ignore: unnecessary_brace_in_string_interps
      ratingCount != null ? Text('  (${ratingCount})') : Container()
    ]);
  }
}
