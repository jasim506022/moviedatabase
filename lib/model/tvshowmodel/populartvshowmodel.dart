class TVShowModel {
  final String backdropPath;
  final String firstAirDate;
//final  int genreIds;
  final int id;
  final String name;
//final  String originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final double voteAverage;
  final int voteCount;
  TVShowModel({
    required this.backdropPath,
    required this.firstAirDate,
    //required this.genreIds,
    required this.id,
    required this.name,
    //required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TVShowModel.fromMap(Map<String, dynamic> map) {
    return TVShowModel(
      backdropPath: map['backdrop_path'] ?? '',
      firstAirDate: map['first_air_date'] ?? '',
      //  genreIds: map['genre_ids'][0]?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      //originCountry: map['origin_country'][0] ?? '',
      originalLanguage: map['original_language'] ?? '',
      originalName: map['original_name'] ?? '',
      overview: map['overview'] ?? '',
      popularity: map['popularity']?.toDouble() ?? 0.0,
      posterPath: map['poster_path'] ?? '',
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      voteCount: map['vote_count']?.toInt() ?? 0,
    );
  }

  static List<TVShowModel> snaphshotPopularTVList(List movieList) {
    return movieList.map((e) => TVShowModel.fromMap(e)).toList();
  }
}
