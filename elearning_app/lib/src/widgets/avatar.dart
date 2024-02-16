import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key, this.url, this.width, this.height});

  final String? url;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: CachedNetworkImage(
        imageUrl: url ?? '',
        fit: BoxFit.cover,
        errorWidget: (context, error, stackTrace) => const Icon(
          Icons.broken_image,
          color: Color.fromARGB(255, 165, 165, 165),
          size: 32,
        ),
      ),
    );
  }
}
