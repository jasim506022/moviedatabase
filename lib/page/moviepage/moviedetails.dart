import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/provider/movieprovider.dart';
import 'package:provider/provider.dart';
import '../../utilis/function.dart';
import '../../widget/castperson.dart';
import '../../widget/itemreview.dart';
import '../../widget/listmovieitem.dart';
import '../../widget/shademaskimagesingle.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({super.key, required this.id});

  final String id;

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  //MovieDetailsModel? movieDetailsModel;

  @override
  void initState() {
    // getMovieDetails();
    super.initState();
    final postModel = Provider.of<MovieProvider>(context, listen: false);
    postModel.getMovideDetails(id: widget.id);
  }

  // Future<void> getMovieDetails() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   movieDetailsModel = await ApiService.getDetailsMovie(id: widget.id);
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<MovieProvider>(context);
    return Scaffold(
        body: postModel.isLoading
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
                          imageUrl: postModel.movieDetailsModel!.backdropPath,
                        ),
                        Padding(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          postModel.movieDetailsModel!.title,
                                          maxLines: 2,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 6, top: 4),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8),
                                                child: Text(
                                                  postModel.movieDetailsModel!
                                                      .releaseDate
                                                      .substring(0, 4),
                                                  style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                              color: Colors
                                                                  .white60,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                ),
                                              ),
                                              circularBox(),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8),
                                                child: Text(
                                                  postModel.movieDetailsModel!
                                                      .genres,
                                                  style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                              color: Colors
                                                                  .white60,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                ),
                                              ),
                                              circularBox(),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 13),
                                                child: Text(
                                                  postModel.movieDetailsModel!
                                                      .runtime
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                              color: Colors
                                                                  .white60,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
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
                                              postModel.movieDetailsModel!
                                                  .voteAverage
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              " (${postModel.movieDetailsModel!.voteCount})",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  color: Colors.white60,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  postModel.movieDetailsModel!.video
                                      ? Container(
                                          height: 40,
                                          width: 40,
                                          decoration: const BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle),
                                          child: const Icon(
                                            Icons.play_arrow_rounded,
                                            color: Colors.white,
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
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
                              text: postModel.movieDetailsModel!.overview),
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
                              itemCount: postModel
                                  .movieDetailsModel!.credits.cast.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return CastPerson(
                                  image: postModel.movieDetailsModel!.credits
                                      .cast[index].profilePath,
                                  name: postModel.movieDetailsModel!.credits
                                      .cast[index].name,
                                );
                              },
                            ),
                          ),
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
                          Text("Reviews",
                              style: Theme.of(context).textTheme.bodyLarge),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 180,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: postModel
                                  .movieDetailsModel!.review.results.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return ItemReview(
                                    name: postModel.movieDetailsModel!.review
                                        .results[index].name,
                                    overview: postModel.movieDetailsModel!
                                        .review.results[index].content,
                                    username: postModel.movieDetailsModel!
                                        .review.results[index].username,
                                    imageUrl: postModel.movieDetailsModel!
                                        .review.results[index].avatarPath,
                                    rating: postModel.movieDetailsModel!.review
                                        .results[index].rating);
                              },
                            ),
                          ),
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
                          Text("Similars Movie",
                              style: Theme.of(context).textTheme.bodyLarge),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .32,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: postModel
                                  .movieDetailsModel!.similar.results.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return ListItem(
                                  imageUrl: postModel.movieDetailsModel!.similar
                                      .results[index].posterPath,
                                  title: postModel.movieDetailsModel!.similar
                                      .results[index].title,
                                  function: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MovieDetailsPage(
                                            id: postModel.movieDetailsModel!
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
                    )
                  ],
                ),
              ));
  }
}
