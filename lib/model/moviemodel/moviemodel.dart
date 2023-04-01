class MovieModel {
  final String backdropPath;
  final int id;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String title;
  final double voteAverage;
  MovieModel({
    required this.backdropPath,
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
  });

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      backdropPath: map['backdrop_path'] ?? '',
      id: map['id']?.toInt() ?? 0,
      overview: map['overview'] ?? '',
      posterPath: map['poster_path'] ?? '',
      releaseDate: map['release_date'] ?? '',
      title: map['title'] ?? '',
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
    );
  }

  static List<MovieModel> snaphshotPopularMovieList(List movieList) {
    return movieList.map((e) => MovieModel.fromMap(e)).toList();
  }
}
