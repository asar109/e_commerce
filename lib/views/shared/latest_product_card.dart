import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class LatestProductCard extends StatelessWidget {
  const LatestProductCard({
    super.key, required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withOpacity(0.8),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.32,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
        ));
  }
}