class SimilarTVShowModel {
  final List<Results> results;
  SimilarTVShowModel({
    required this.results,
  });

  SimilarTVShowModel copyWith({
    List<Results>? results,
  }) {
    return SimilarTVShowModel(
      results: results ?? this.results,
    );
  }

  factory SimilarTVShowModel.fromMap(Map<String, dynamic> map) {
    return SimilarTVShowModel(
      results:
          List<Results>.from(map['results']?.map((x) => Results.fromMap(x))),
    );
  }
}

class Results {
  final bool adult;
  final String backdropPath;

  final int id;

  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final String firstAirDate;
  final String name;
  final double voteAverage;
  final int voteCount;
  Results({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Results.fromMap(Map<String, dynamic> map) {
    return Results(
      adult: map['adult'] ?? false,
      backdropPath: map['backdrop_path'] ?? '',
      id: map['id']?.toInt() ?? 0,
      originalLanguage: map['original_language'] ?? '',
      originalName: map['original_name'] ?? '',
      overview: map['overview'] ?? '',
      popularity: map['popularity']?.toDouble() ?? 0.0,
      posterPath: map['poster_path'] ?? '',
      firstAirDate: map['first_air_date'] ?? '',
      name: map['name'] ?? '',
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      voteCount: map['vote_count']?.toInt() ?? 0,
    );
  }
}
