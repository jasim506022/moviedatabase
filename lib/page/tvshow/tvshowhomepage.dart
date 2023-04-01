import 'package:flutter/material.dart';

import 'package:movies/model/tvshowmodel/populartvshowmodel.dart';
import 'package:movies/service/apiservice.dart';
import 'package:movies/widget/tvshowwidget/tvshowsliderwidget.dart';

import '../../widget/listheadershow.dart';

import '../../widget/tvshowwidget/tvshowlistviewbuilder.dart';
import 'alltvshow.dart';

class TVShowHomePage extends StatefulWidget {
  const TVShowHomePage({super.key});

  @override
  State<TVShowHomePage> createState() => _TVShowHomePageState();
}

class _TVShowHomePageState extends State<TVShowHomePage> {
  List<TVShowModel> tvshowList = [];

  @override
  void initState() {
    getAllPopularTVshow();
    super.initState();
  }

  Future<void> getAllPopularTVshow() async {
    tvshowList = await ApiService.getAllTVShow(
        page: 1.toString(), tvshowitem: 'popular');
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
            TVShowSliderWidget(
              height: height,
              width: width,
              tvshowlish: tvshowList,
            ),
            ListHeaderShow(
              name: "Popular TV Show",
              movieListItem: 'popular',
              function: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AllTVShow(
                        tvshowitem: 'popular',
                      ),
                    ));
              },
            ),
            TVshowListViewBuilder(
              height: height,
              tvshowitem: 'popular',
            ),
            const SizedBox(
              height: 10,
            ),
            ListHeaderShow(
              name: "Airing Today TV Show",
              movieListItem: 'airing_today',
              function: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AllTVShow(
                        tvshowitem: 'airing_today',
                      ),
                    ));
              },
            ),
            const SizedBox(
              height: 5,
            ),
            TVshowListViewBuilder(
              height: height,
              tvshowitem: 'top_rated',
            ),
            const SizedBox(
              height: 10,
            ),
            ListHeaderShow(
              name: "Top Rated TV Show",
              movieListItem: 'top_rated',
              function: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AllTVShow(
                        tvshowitem: 'top_rated',
                      ),
                    ));
              },
            ),
            const SizedBox(
              height: 5,
            ),
            TVshowListViewBuilder(
              height: height,
              tvshowitem: 'top_rated',
            ),
          ],
        ),
      ),
    );
  }
}
