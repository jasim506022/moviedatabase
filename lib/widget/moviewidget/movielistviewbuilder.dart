import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../page/moviepage/moviedetails.dart';
import '../../provider/movieprovider.dart';
import '../listmovieitem.dart';

class MovieListViewBuilder extends StatefulWidget {
  const MovieListViewBuilder({
    super.key,
    required this.height,
    required this.movieItem,
  });

  final double height;
  final String movieItem;

  @override
  State<MovieListViewBuilder> createState() => _MovieListViewBuilderState();
}

class _MovieListViewBuilderState extends State<MovieListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    final movieProivder = Provider.of<MovieProvider>(context);
    return SizedBox(
        height: widget.height * .32,
        child: FutureBuilder(
          future: movieProivder.getAllMovies(
              movieItem: widget.movieItem, page: "1"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.red,
              ));
            }
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: ListItem(
                    imageUrl: snapshot.data![index].backdropPath,
                    title: snapshot.data![index].title,
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailsPage(
                              id: snapshot.data![index].id.toString(),
                            ),
                          ));
                    },
                  ),
                );
              },
            );
          },
        ));
  }
}



// FutureBuilder(
//         future: ApiService.getAllPopularMovieModel(
//             page: '1', movieItem: movieItem),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           return ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: snapshot.data!.length,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.only(left: 16),
//                 child: ListItem(
//                   imageUrl: snapshot.data![index].backdropPath,
//                   title: snapshot.data![index].title,
//                   function: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => MovieDetailsPage(
//                             id: snapshot.data![index].id.toString(),
//                           ),
//                         ));
//                   },
//                 ),
//               );
//             },
//           );
//         },
//       ),