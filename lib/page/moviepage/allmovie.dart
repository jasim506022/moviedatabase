import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../provider/movieprovider.dart';
import '../../utilis/function.dart';
import '../../widget/moviewidget/singlemoviedetails.dart';

class AllMovie extends StatefulWidget {
  const AllMovie({super.key, required this.movieItem});
  final String movieItem;

  @override
  State<AllMovie> createState() => _AllMovieState();
}

class _AllMovieState extends State<AllMovie> {
  // List<MovieModel> popularmovielist = [];

  // int currentIndex = 0;

  String title = "";

  getTitle() {
    if (widget.movieItem == "popular") {
      title = "Popular Movie";
    } else if (widget.movieItem == "top_rated") {
      title = "Top Rated Movie";
    } else {
      title = "Upcoming Movie";
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getTitle();
    super.initState();
  }
  // Future scrollToitem({required int index}) async {
  //   await Scrollable.ensureVisible(context);
  // }
  // Future<void> getAllData({required int page}) async {
  //   if (widget.movieItem == "popluar") {
  //     title = "Popular Movie";
  //     popularmovielist = await ApiService.getAllPopularMovieModel(
  //         page: page.toString(), movieItem: 'popular');
  //     setState(() {});
  //   } else if (widget.movieItem == "top_rated") {
  //     title = "Top Rated Movie";
  //     popularmovielist = await ApiService.getAllPopularMovieModel(
  //         page: page.toString(), movieItem: 'top_rated');
  //     setState(() {});
  //   } else {
  //     title = "Upcoming Movie";
  //     popularmovielist = await ApiService.getAllPopularMovieModel(
  //         page: page.toString(), movieItem: 'upcoming');
  //     setState(() {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final movieProvider = Provider.of<MovieProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(26, 29, 31, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(26, 29, 31, 1),
        title: Text(title),
      ),
      body: Column(
        children: [
          SizedBox(
            height: kBottomNavigationBarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttonWidgetStyle(
                    context: context,
                    text: "Pre",
                    function: () {
                      if (movieProvider.currentIndex == 0) {
                        return;
                      }
                      movieProvider.removeCurrentIndex();
                      movieProvider
                          .setCounterPage(movieProvider.currentIndex + 1);
                    }),
                Flexible(
                  flex: 2,
                  child: ListView.builder(
                    itemCount: 999,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Consumer<MovieProvider>(
                            builder: (context, value, child) {
                              return Material(
                                color: value.currentIndex == index
                                    ? Colors.yellow
                                    : Colors.white,
                                child: InkWell(
                                  onTap: () {
                                    value.setCurrentIndex(index);
                                    value
                                        .setCounterPage(value.currentIndex + 1);
                                    value.counterPage;
                                  },
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${index + 1}",
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )),
                                ),
                              );
                            },
                          ));
                    },
                  ),
                ),
                buttonWidgetStyle(
                    text: "Next",
                    context: context,
                    function: () {
                      if (movieProvider.currentIndex > 999) {
                        return;
                      }
                      movieProvider.addCurrentIndex();
                      movieProvider
                          .setCounterPage(movieProvider.currentIndex + 1);
                    })
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
                height: height,
                child: FutureBuilder(
                  future: movieProvider.getAllMovies(
                      movieItem: widget.movieItem,
                      page: movieProvider.counterPage.toString()),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: Colors.red,
                      ));
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return SingleMovieItem(
                          width: width,
                          popularmovie: snapshot.data![index],
                        );
                      },
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
