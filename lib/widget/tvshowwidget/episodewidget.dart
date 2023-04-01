import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/apiconstant.dart';
import '../../model/tvshowmodel/season.dart';

class EpisodeWidget extends StatelessWidget {
  const EpisodeWidget({
    super.key,
    required this.seasonModel,
  });

  final SeasonModel seasonModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FancyShimmerImage(
                height: double.infinity,
                width: 150,
                boxFit: BoxFit.fill,
                errorWidget: Image.asset(
                  "assets/noimage.jpg",
                  fit: BoxFit.cover,
                ),
                imageUrl: '$IMAGE_BASE_URL${seasonModel.posterPath}',
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Epiosde ${seasonModel.episodeCount}",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w700)),
                const SizedBox(
                  height: 4,
                ),
                Text(seasonModel.name,
                    maxLines: 2,
                    style: GoogleFonts.domine(
                        fontSize: 16,
                        color: Colors.white70,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  seasonModel.airDate,
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.white,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  seasonModel.seasonNumber.toString(),
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.white,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
