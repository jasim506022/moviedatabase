import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/model/tvshowmodel/populartvshowmodel.dart';
import '../../const/apiconstant.dart';
import '../../page/tvshow/tvshowdetails.dart';

class SingleTVshow extends StatelessWidget {
  const SingleTVshow({
    super.key,
    required this.width, required this.popularTVShowModel,
   
  });

  final double width;
  final TVShowModel popularTVShowModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TVShowDetails(
                id: popularTVShowModel.id.toString(),
              ),
            ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        height: MediaQuery.of(context).size.height * .26,
        width: width,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(39, 43, 48, 1),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FancyShimmerImage(
                height: MediaQuery.of(context).size.height * .26,
                width: width * .3,
                boxFit: BoxFit.fill,
                errorWidget: const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                imageUrl:
                    '$IMAGE_BASE_URL${popularTVShowModel.posterPath}',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 18),
              width: width * .55,
              height: MediaQuery.of(context).size.height * .3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(popularTVShowModel.name,
                      maxLines: 2,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 17))),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        popularTVShowModel.firstAirDate.substring(0, 4),
                        style: const TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rate_rounded,
                            color: Colors.yellow,
                            size: 20,
                          ),
                          Text(popularTVShowModel.voteAverage.toString(),
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.white60,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(popularTVShowModel.overview,
                      maxLines: 2,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.white60,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
