import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/tvshowmodel/detailstvshowmodel.dart';
import '../../utilis/function.dart';

class TVShowDetailsHearder extends StatelessWidget {
  const TVShowDetailsHearder({
    super.key,
    required this.tvshowDetailsModel,
  });

  final TVShowDetailsModel? tvshowDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .6,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tvshowDetailsModel!.name,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6, top: 4),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              tvshowDetailsModel!.firstAirDate.substring(0, 4),
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Colors.white60,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                          circularBox(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              tvshowDetailsModel!.genres,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Colors.white60,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                          circularBox(),
                          Padding(
                            padding: const EdgeInsets.only(left: 13),
                            child: Text(
                              "${tvshowDetailsModel!.numberOfSeasons} seasons",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Colors.white60,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rate_rounded,
                          color: Colors.yellow,
                          size: 20,
                        ),
                        Text(
                          tvshowDetailsModel!.voteAverage.toStringAsFixed(2),
                          style:  GoogleFonts.poppins(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          " (${tvshowDetailsModel!.voteCount})",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white60,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}
