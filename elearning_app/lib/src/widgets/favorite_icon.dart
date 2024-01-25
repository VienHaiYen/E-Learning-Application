import 'package:flutter/material.dart';

class FavoriteIcon extends StatelessWidget {
  final bool isInterested;
  final VoidCallback? onPressed;

  const FavoriteIcon({super.key, required this.isInterested, this.onPressed});

  Widget buildFavorite(BuildContext context) {
    Icon icon;
    if (isInterested) {
      icon = const Icon(
        Icons.favorite,
        size: 24,
        color: Colors.pink,
      );
    } else {
      icon = const Icon(
        Icons.favorite_border,
        size: 24,
        color: Colors.blue,
      );
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: buildFavorite(context),
    );
  }
}
