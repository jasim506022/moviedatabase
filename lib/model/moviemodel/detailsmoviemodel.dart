
import 'package:movies/model/castmodel.dart';
import 'reviewmodel.dart';
import 'similarmodel.dart';

class MovieDetailsModel {
  final bool adult;
  final String backdropPath;
  final int budget;
  final String homepage;
  final int id;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String genres;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final Credits credits;
  final ReviewModels review;
  final SimilarModels similar;
  final int voteCount;
  MovieDetailsModel(
      {required this.adult,
      required this.backdropPath,
      required this.budget,
      required this.homepage,
      required this.id,
      required this.imdbId,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.genres,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.revenue,
      required this.runtime,
      required this.status,
      required this.tagline,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.credits,
      required this.voteCount,
      required this.review,
      required this.similar});

  factory MovieDetailsModel.fromMap(Map<String, dynamic> map) {
    return MovieDetailsModel(
      adult: map['adult'] ?? false,
      backdropPath: map['backdrop_path'] ?? '',
      budget: map['budget']?.toInt() ?? 0,
      homepage: map['homepage'] ?? '',
      id: map['id']?.toInt() ?? 0,
      imdbId: map['imdb_id'] ?? '',
      originalLanguage: map['original_language'] ?? '',
      originalTitle: map['original_title'] ?? '',
      overview: map['overview'] ?? '',
      popularity: map['popularity']?.toDouble() ?? 0.0,
      posterPath: map['poster_path'] ?? '',
      releaseDate: map['release_date'] ?? '',
      revenue: map['revenue']?.toInt() ?? 0,
      runtime: map['runtime']?.toInt() ?? 0,
      status: map['status'] ?? '',
      tagline: map['tagline'] ?? '',
      title: map['title'] ?? '',
      video: map['video'] ?? false,
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      //  cast: CastModel.fromMap(map['cast']),
      voteCount: map['vote_count']?.toInt() ?? 0,
      genres: map['genres'][0]['name']??"",
      credits: Credits.fromMap(map['credits']),
      review: ReviewModels.fromMap(map['reviews']),
      similar: SimilarModels.fromMap(map['similar']),
    );
  }
}
