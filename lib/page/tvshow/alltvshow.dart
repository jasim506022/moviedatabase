import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/provider/tvshowprovider.dart';
import 'package:provider/provider.dart';
import '../../utilis/function.dart';
import '../../widget/tvshowwidget/singletvshowdetails.dart';

class AllTVShow extends StatefulWidget {
  const AllTVShow({
    super.key,
    required this.tvshowitem,
  });
  final String tvshowitem;

  @override
  State<AllTVShow> createState() => _AllTVShowState();
}

class _AllTVShowState extends State<AllTVShow> {
  // List<TVShowModel> tvShowList = [];

  @override
  void initState() {
    // TODO: implement initState
    getTitle();
    super.initState();
  }

  String title = "";

  getTitle() {
    if (widget.tvshowitem == "popular") {
      title = "Popular TV Show";
    } else if (widget.tvshowitem == "airing_today") {
      title = "Airing Today TV Show";
    } else {
      title = "Top Rated TV Show";
    }
  }

  // int currentIndex = 0;
  // int page = 1;
  // String title = "";

  // bool isLoading = false;
  // @override
  // void initState() {
  //   getAllData(page: page);
  //   super.initState();
  // }

  // Future<void> getAllData({required int page}) async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   if (widget.tvshowitem == "popluar") {
  //     setState(() {
  //       title = "Popular TV Show";
  //     });
  //     tvShowList = await ApiService.getAllPopularTVShow(
  //       page: page.toString(),
  //       tvshowitem: 'popular',
  //     );
  //     setState(() {
  //       isLoading = false;
  //     });
  //   } else if (widget.tvshowitem == "top_rated") {
  //     title = "Top Rated TV Show";
  //     tvShowList = await ApiService.getAllPopularTVShow(
  //         page: page.toString(), tvshowitem: 'top_rated');
  //     setState(() {
  //       isLoading = false;
  //     });
  //   } else {
  //     title = "Airing Today TV Show";
  //     tvShowList = await ApiService.getAllPopularTVShow(
  //         page: page.toString(), tvshowitem: 'airing_today');
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final tvshowProvider = Provider.of<TVShowProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(26, 29, 31, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(26, 29, 31, 1),
        title:  Text(title),
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
                      if (tvshowProvider.currentIndex == 0) {
                        return;
                      }
                      tvshowProvider.removeCurrentIndex();
                      tvshowProvider
                          .setCounterPage(tvshowProvider.currentIndex + 1);
                    }),
                Flexible(
                  flex: 2,
                  child: ListView.builder(
                    itemCount: 999,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Consumer<TVShowProvider>(
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
                      if (tvshowProvider.currentIndex > 999) {
                        return;
                      }
                      tvshowProvider.addCurrentIndex();
                      tvshowProvider
                          .setCounterPage(tvshowProvider.currentIndex + 1);
                    })
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
                height: height,
                child: FutureBuilder(
                  future: tvshowProvider.getAllTVShow(tvshowItem: widget.tvshowitem, page: tvshowProvider.counterPage.toString()),
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
                        return SingleTVshow(width: width, 
                        popularTVShowModel: snapshot.data![index]);
                      }, );
                  },) ),
          ),
        ],
      ),
    );
  }
}
