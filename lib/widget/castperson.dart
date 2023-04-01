import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../const/apiconstant.dart';

class CastPerson extends StatelessWidget {
  const CastPerson({
    super.key,
    required this.image,
    required this.name,
  });

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: SizedBox(
        height: 170,
        width: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FancyShimmerImage(
                height: 120,
                width: 120,
                boxFit: BoxFit.fill,
                errorWidget: const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                imageUrl: '$IMAGE_BASE_URL$image',
              ),
            ),
            Text(
              name,
              maxLines: 2,
              style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}