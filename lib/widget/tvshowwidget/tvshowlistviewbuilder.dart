import 'package:flutter/material.dart';
import 'package:movies/provider/tvshowprovider.dart';
import 'package:provider/provider.dart';
import '../../page/tvshow/tvshowdetails.dart';
import '../listmovieitem.dart';


class TVshowListViewBuilder extends StatefulWidget {
  const TVshowListViewBuilder({
    super.key,
    required this.height, required this.tvshowitem,
  });

  final double height;
  final String tvshowitem;

  @override
  State<TVshowListViewBuilder> createState() => _TVshowListViewBuilderState();
}

class _TVshowListViewBuilderState extends State<TVshowListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    final tvshowProvider = Provider.of<TVShowProvider>(context);
    return SizedBox(
      height: widget.height * .32,
      child: FutureBuilder(
        future: tvshowProvider.getAllTVShow(tvshowItem: widget.tvshowitem, page: "1") ,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ListItem(
                  imageUrl: snapshot.data![index].backdropPath,
                  title: snapshot.data![index].name,
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TVShowDetails(
                            id: snapshot.data![index].id.toString(),
                          ),
                        ));
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
