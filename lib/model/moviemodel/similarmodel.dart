class SimilarModels {

final List<SimilarResult> results;
  SimilarModels({
    required this.results,
  });

  factory SimilarModels.fromMap(Map<String, dynamic> map) {
    return SimilarModels(
      results: List<SimilarResult>.from(map['results'].map((x) => SimilarResult.fromMap(x))),
    );
  }

  
}

class SimilarResult {
 final bool adult;
final  String backdropPath;

 final int id;
 final String originalLanguage;
 final String originalTitle;
 final String overview;
 final double popularity;
 final String posterPath;
final  String releaseDate;
final  String title;
 final bool video;
final  double voteAverage;
final  int voteCount;
  SimilarResult({
    required this.adult,
    required this.backdropPath,
   
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });


  factory SimilarResult.fromMap(Map<String, dynamic> map) {
    return SimilarResult(
      adult: map['adult'] ?? false,
      backdropPath: map['backdrop_path'] ?? '',
     
      id: map['id']?.toInt() ?? 0,
      originalLanguage: map['original_language'] ?? '',
      originalTitle: map['original_title'] ?? '',
      overview: map['overview'] ?? '',
      popularity: map['popularity']?.toDouble() ?? 0.0,
      posterPath: map['poster_path'] ?? '',
      releaseDate: map['release_date'] ?? '',
      title: map['title'] ?? '',
      video: map['video'] ?? false,
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      voteCount: map['vote_count']?.toInt() ?? 0,
    );
  }

  
}
