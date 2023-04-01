import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../const/apiconstant.dart';

class ShaderMaskImage extends StatelessWidget {
  const ShaderMaskImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.dstIn,
      shaderCallback: (bounds) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.black, Colors.transparent],
          stops: [0.1, 0.1, 1],
        ).createShader(Rect.fromLTRB(0, 0, bounds.width, bounds.height));
      },
      child: CachedNetworkImage(
        height: MediaQuery.of(context).size.height * 0.6,
        width: double.infinity,
        fit: BoxFit.fill,
        imageUrl: "$IMAGE_BASE_URL$imageUrl",
        errorWidget: (context, url, error) => Image.asset(
          "assets/nophoto.jpg",
          height: MediaQuery.of(context).size.height * 0.6,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),

      // Image(
      //   image: "$IMAGE_BASE_URL$imageUrl"==? NetworkImage(
      //     "$IMAGE_BASE_URL$imageUrl",
      //   ),
      //   height: MediaQuery.of(context).size.height * 0.6,
      //   width: double.infinity,
      //   fit: BoxFit.fill,
      // ),
    );
  }
}
