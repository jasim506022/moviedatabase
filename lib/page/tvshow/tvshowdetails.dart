import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/page/moviepage/moviedetails.dart';
import 'package:movies/provider/tvshowprovider.dart';
import 'package:provider/provider.dart';
import '../../model/tvshowmodel/detailstvshowmodel.dart';
import '../../utilis/function.dart';
import '../../widget/castperson.dart';
import '../../widget/listmovieitem.dart';
import '../../widget/shademaskimagesingle.dart';
import '../../widget/tvshowwidget/episodewidget.dart';
import '../../widget/tvshowwidget/lastepisodewidget.dart';
import '../../widget/tvshowwidget/tvshowdetailshhearder.dart';

class TVShowDetails extends StatefulWidget {
  const TVShowDetails({super.key, required this.id});

  final String id;

  @override
  State<TVShowDetails> createState() => _TVShowDetailsState();
}

class _TVShowDetailsState extends State<TVShowDetails> {
  //TVShowDetailsModel? tvshowDetailsModel;

  //bool isLoading = true;

  @override
  void initState() {
    super.initState();
    final tvShowModel = Provider.of<TVShowProvider>(context, listen: false);
    tvShowModel.getTVShowDetails(id: widget.id);
  }

  // Future<void> getMovieDetails() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   tvshowDetailsModel = await ApiService.getDetailsTVShow(id: widget.id);
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final tvShowModelProvider = Provider.of<TVShowProvider>(context);
    return Scaffold(
        body: tvShowModelProvider.isLoading
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.red,
              ))
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ShaderMaskImage(
                          imageUrl:tvShowModelProvider.tvShowDetailsModel!.backdropPath,
                        ),
                        TVShowDetailsHearder(
                            tvshowDetailsModel: tvShowModelProvider.tvShowDetailsModel!),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: const BoxDecoration(
                                    color: Color(0xB2272830),
                                    shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  size: 22,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: const BoxDecoration(
                                    color: Color(0xB2272830),
                                    shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.bookmark_sharp,
                                  size: 22,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: const BoxDecoration(
                                    color: Color(0xB2272830),
                                    shape: BoxShape.circle),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    size: 22,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: const BoxDecoration(
                                    color: Color(0xB2272830),
                                    shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.bookmark_sharp,
                                  size: 22,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 16, left: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Story",
                              style: Theme.of(context).textTheme.bodyLarge),
                          const SizedBox(
                            height: 5,
                          ),
                          readMoreTextFunction(
                              text: tvShowModelProvider.tvShowDetailsModel!.overview)
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 16, left: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Last Episode on Air",
                              style: Theme.of(context).textTheme.bodyLarge),
                          const SizedBox(
                            height: 5,
                          ),
                          LastEpisodeWidget(
                              tvshowDetailsModel: tvShowModelProvider.tvShowDetailsModel!)
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 16, left: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Seasons",
                              style: Theme.of(context).textTheme.bodyLarge),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxHeight: 400),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: tvShowModelProvider.tvShowDetailsModel!.seasons.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    _showBottomSheet(
                                        context,
                                        tvShowModelProvider.tvShowDetailsModel!,
                                        );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 150,
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: FancyShimmerImage(
                                              height: double.infinity,
                                              width: 150,
                                              boxFit: BoxFit.fill,
                                              errorWidget: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: Image.network(
                                                  "https://image.tmdb.org/t/p/original${tvShowModelProvider.tvShowDetailsModel!.backdropPath}",
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              imageUrl:
                                                  'https://image.tmdb.org/t/p/original${tvShowModelProvider.tvShowDetailsModel!.seasons[index].posterPath}',
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 14),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Season ${tvShowModelProvider.tvShowDetailsModel!.seasons[index].seasonNumber + 1}",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 16,
                                                        color: Colors.white,
                                                        letterSpacing: 1,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(vertical: 6),
                                                    child: Text(
                                                      '${tvShowModelProvider.tvShowDetailsModel!.seasons[index].episodeCount} ${"episodes".toLowerCase()}',
                                                      style: GoogleFonts.domine(
                                                          fontSize: 15,
                                                          color: Colors.white70,
                                                          letterSpacing: 1,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                    ),
                                                  ),
                                                  if (tvShowModelProvider.tvShowDetailsModel!
                                                      .seasons[index]
                                                      .airDate
                                                      .isNotEmpty) ...[
                                                    Text(
                                                      tvShowModelProvider.tvShowDetailsModel!
                                                          .seasons[index]
                                                          .airDate,
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.white,
                                                              letterSpacing: 1,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                  ],
                                                  if (tvShowModelProvider.tvShowDetailsModel!
                                                      .seasons[index]
                                                      .overview
                                                      .isNotEmpty) ...[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 4),
                                                      child: Text(
                                                        tvShowModelProvider.tvShowDetailsModel!
                                                            .seasons[index]
                                                            .overview,
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .white70,
                                                                letterSpacing:
                                                                    1,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                    ),
                                                  ],
                                                ],
                                              ),
                                            ),
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 16, left: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Similars TV Show",
                              style: Theme.of(context).textTheme.bodyLarge),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .32,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount:
                                  tvShowModelProvider.tvShowDetailsModel!.similar.results.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return ListItem(
                                  imageUrl: tvShowModelProvider.tvShowDetailsModel!
                                      .similar.results[index].posterPath,
                                  title: tvShowModelProvider.tvShowDetailsModel!
                                      .similar.results[index].name,
                                  function: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MovieDetailsPage(
                                            id: tvShowModelProvider.tvShowDetailsModel!
                                                .similar.results[index].id
                                                .toString(),
                                          ),
                                        ));
                                  },
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 16, left: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Cast",
                              style: Theme.of(context).textTheme.bodyLarge),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 170,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount:
                                  tvShowModelProvider.tvShowDetailsModel!.credits.cast.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return CastPerson(
                                  image: tvShowModelProvider.tvShowDetailsModel!
                                      .credits.cast[index].profilePath,
                                  name: tvShowModelProvider.tvShowDetailsModel!
                                      .credits.cast[index].name,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
  }

  void _showBottomSheet(context, TVShowDetailsModel tvShowDetailsModel) {
    showCustomBottomSheet(
        context,
        ListView.builder(
          itemCount: tvShowDetailsModel.seasons.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: EpisodeWidget(
                  seasonModel: tvShowDetailsModel.seasons[index]),
            );
          },
        ));
  }
}




void showCustomBottomSheet(BuildContext context, Widget child) {
  final size = MediaQuery.of(context).size.height;
  showModalBottomSheet(
    context: context,
    backgroundColor: const Color(0xff1a1d1f),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      ),
    ),
    builder: (context) {
      return SizedBox(
        height: size * 0.5,
        child: child,
      );
    },
  );
}

