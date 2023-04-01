import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/apiconstant.dart';
import '../../model/tvshowmodel/detailstvshowmodel.dart';

class LastEpisodeWidget extends StatelessWidget {
  const LastEpisodeWidget({
    super.key,
    required this.tvshowDetailsModel,
  });

  final TVShowDetailsModel? tvshowDetailsModel;

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
                errorWidget: const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                imageUrl:
                    '$IMAGE_BASE_URL${tvshowDetailsModel!.lastEpisodeToAir.stillPath}',
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Epiosde ${tvshowDetailsModel!.lastEpisodeToAir.episodeNumber}",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w700)),
                const SizedBox(
                  height: 4,
                ),
                Text(tvshowDetailsModel!.lastEpisodeToAir.name,
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
                  tvshowDetailsModel!.lastEpisodeToAir.airDate,
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.white,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  tvshowDetailsModel!.lastEpisodeToAir.runtime.toString(),
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
