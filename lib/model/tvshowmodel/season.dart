
class SeasonModel {
 final  String airDate;
 final int episodeCount;
 final int id;
 final String name;
 final String overview;
 final String posterPath;
 final int seasonNumber;
  SeasonModel({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
  });

 

  
  factory SeasonModel.fromMap(Map<String, dynamic> map) {
    return SeasonModel(
      airDate: map['air_date'] ?? '',
      episodeCount: map['episode_count']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      overview: map['overview'] ?? '',
      posterPath: map['posterPath'] ?? '',
      seasonNumber: map['season_number']?.toInt() ?? 0,
    );
  }

  
}
