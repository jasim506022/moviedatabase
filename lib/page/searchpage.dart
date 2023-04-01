import 'package:flutter/material.dart';
import 'package:movies/page/moviepage/moviedetails.dart';
import 'package:movies/provider/searchprovider.dart';
import 'package:provider/provider.dart';
import '../model/moviemodel/moviemodel.dart';
import '../service/apiservice.dart';
import '../widget/listmovieitem.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // List<MovieModel> popularMovieList = [];

  // String search = "";

  @override
  void initState() {
    super.initState();
  }

  // Future<void> getAllPopularMovie({required String search}) async {
  //   popularMovieList = await ApiService.getAllSearchMovie(title: search);
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Search"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Consumer<SearchProvider>(
                builder: (context, value, child) {
                  return TextField(
                    onChanged: (value) {
                      searchProvider.setSearch(value);
                    },
                    onEditingComplete: () {
                      if (searchProvider.search.isNotEmpty) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      }
                    },
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    cursorColor: Colors.white,
                    autofocus: true,
                    autocorrect: false,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        hintText: "Search Here",
                        hintStyle: const TextStyle(color: Colors.white60),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2)),
                        border: OutlineInputBorder()),
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: FutureBuilder(
                      future: searchProvider.getAllMovies(
                          search: searchProvider.search),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: CircularProgressIndicator(
                            color: Colors.red,
                          ));
                        } else if (!snapshot.hasData) {
                          return const Text(
                            "No Movie Found",
                          );
                        }
                        return GridView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return ListItem(
                              title: snapshot.data![index].title,
                              imageUrl: snapshot.data![index].backdropPath,
                              function: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MovieDetailsPage(
                                          id: snapshot.data![index].id
                                              .toString()),
                                    ));
                              },
                            );
                          },
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: .9,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 15,
                                  crossAxisCount: 2),
                        );
                      },
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
