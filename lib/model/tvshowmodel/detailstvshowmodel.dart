import 'package:movies/model/tvshowmodel/season.dart';
import 'package:movies/model/tvshowmodel/video.dart';

import '../castmodel.dart';
import 'lastepisodetoair.dart';
import 'tvsmiliarmodel.dart';

class TVShowDetailsModel {
  final bool adult;
  final String backdropPath;

  final String firstAirDate;
  final String genres;
  final int id;
  final String languages;
  final String lastAirDate;
  final LastEpisodeToAir lastEpisodeToAir;
  final String name;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final String originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<SeasonModel> seasons;
  final String status;
  final String tagline;
  final String type;
  final double voteAverage;
  final int voteCount;
  final VideosModel videos;
  final SimilarTVShowModel similar;
  final Credits credits;
  TVShowDetailsModel(
      {required this.adult,
      required this.backdropPath,
     
      required this.firstAirDate,
      required this.genres,
      required this.id,
      required this.languages,
      required this.lastAirDate,
      required this.lastEpisodeToAir,
      required this.name,
      required this.numberOfEpisodes,
      required this.numberOfSeasons,
      required this.originCountry,
      required this.originalLanguage,
      required this.originalName,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.seasons,
      required this.status,
      required this.tagline,
      required this.type,
      required this.voteAverage,
      required this.voteCount,
      required this.videos,
      required this.similar,
      required this.credits});

  factory TVShowDetailsModel.fromMap(Map<String, dynamic> map) {
    return TVShowDetailsModel(
      adult: map['adult'] ?? false,
      backdropPath: map['backdrop_path'] ?? '',
      
      firstAirDate: map['last_air_date'] ?? '',
      genres: map['genres'][0]['name'] ?? '',
      id: map['id']?.toInt() ?? 0,
      languages: map['languages'][0] ?? '',
      lastAirDate: map['last_air_date'] ?? '',
      lastEpisodeToAir: LastEpisodeToAir.fromMap(map['last_episode_to_air']),
      name: map['name'] ?? '',
      numberOfEpisodes: map['number_of_episodes']?.toInt() ?? 0,
      numberOfSeasons: map['number_of_seasons']?.toInt() ?? 0,
      originCountry: map['origin_country'][0] ?? '',
      originalLanguage: map['original_language'] ?? '',
      originalName: map['original_name'] ?? '',
      overview: map['overview'] ?? '',
      popularity: map['popularity']?.toDouble() ?? 0.0,
      posterPath: map['poster_path'] ?? '',
      seasons: List<SeasonModel>.from(
          map['seasons']?.map((x) => SeasonModel.fromMap(x))),
      status: map['status'] ?? '',
      tagline: map['tagline'] ?? '',
      type: map['type'] ?? '',
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      voteCount: map['vote_count']?.toInt() ?? 0,
      videos: VideosModel.fromMap(map['videos']),
      similar: SimilarTVShowModel.fromMap(map['similar']),
      credits: Credits.fromMap(map['credits']),
    );
  }
}
