import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/model/moviemodel/moviemodel.dart';
import 'package:movies/service/apiservice.dart';
import '../../widget/listheadershow.dart';
import '../../widget/moviewidget/movielistviewbuilder.dart';
import '../../widget/moviewidget/moviesliderwidget.dart';
import 'allmovie.dart';

class MovieHomePage extends StatefulWidget {
  const MovieHomePage({super.key});

  @override
  State<MovieHomePage> createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
  List<MovieModel> movies = [];
  @override
  void initState() {
    super.initState();
    getAllMovie();
  }

  Future<void> getAllMovie() async {
    movies = await ApiService.getAllMovies(
      page: 1.toString(),
      movieItem: 'popular',
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieSliderWidget(
              height: height,
              width: width,
              movielist: movies,
            ),
            ListHeaderShow(
              name: "Popular Movies",
              movieListItem: 'popluar',
              function: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const AllMovie(movieItem: "popular"),
                    ));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            MovieListViewBuilder(
              height: height,
              movieItem: 'popular',
            ),
            ListHeaderShow(
              name: "Upcoming Movies",
              movieListItem: 'upcoming',
              function: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const AllMovie(movieItem: "upcoming"),
                    ));
              },
            ),
            const SizedBox(
              height: 5,
            ),
            MovieListViewBuilder(
              height: height,
              movieItem: 'upcoming',
            ),
            ListHeaderShow(
                name: "Top Rated Movies",
                movieListItem: 'top_rated',
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const AllMovie(movieItem: "top_rated"),
                      ));
                }),
            const SizedBox(
              height: 5,
            ),
            MovieListViewBuilder(
              height: height,
              movieItem: 'top_rated',
            ),
          ],
        ),
      ),
    );
  }

}
