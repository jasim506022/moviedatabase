import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/apiconstant.dart';

class ItemReview extends StatelessWidget {
  const ItemReview({
    super.key,
    required this.name,
    required this.username,
    required this.overview,
    required this.imageUrl,
    required this.rating,
  });

  final String name;
  final String username;
  final String overview;
  final String imageUrl;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.only(top: 3, left: 10, right: 10, bottom: 3),
      height: 180,
      width: 260,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(39, 43, 48, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipOval(
                child: FancyShimmerImage(
                  boxFit: BoxFit.fill,
                  errorWidget: const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                  imageUrl: '$IMAGE_BASE_URL$imageUrl',
                ),
              ),
            ),
            title: Text(
              name,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700)),
            ),
            subtitle: Text(
              username,
              style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Text(overview,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    color: Color.fromRGBO(161, 162, 165, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RatingBar.builder(
                initialRating: rating / 2,
                minRating: .5,
                itemSize: 15,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
              Text("${rating / 2}y",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
