import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../const/apiconstant.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.imageUrl,
    required this.title,
     required this.function,
  });

  final String imageUrl;
  final String title;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       function();
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: SizedBox(
          width: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: FancyShimmerImage(
                  height: 160,
                  width: double.infinity,
                  boxFit: BoxFit.fill,
                  errorWidget: const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                  imageUrl: '$IMAGE_BASE_URL$imageUrl',
                ),

                // Image(
                //   image: NetworkImage(
                //       "https://image.tmdb.org/t/p/original${imageUrl}"),
                //   height: 160,
                //   width: double.infinity,
                //   fit: BoxFit.fill,
                // ),
              ),
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}