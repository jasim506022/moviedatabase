class LastEpisodeToAir {
  final int id;
  final String name;
  final String overview;
  final int voteAverage;
  final int voteCount;
  final String airDate;
  final int episodeNumber;
  final String productionCode;
  final int runtime;
  final int seasonNumber;
  final int showId;
  final String stillPath;
  LastEpisodeToAir({
    required this.id,
    required this.name,
    required this.overview,
    required this.voteAverage,
    required this.voteCount,
    required this.airDate,
    required this.episodeNumber,
    required this.productionCode,
    required this.runtime,
    required this.seasonNumber,
    required this.showId,
    required this.stillPath,
  });

  factory LastEpisodeToAir.fromMap(Map<String, dynamic> map) {
    return LastEpisodeToAir(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      overview: map['overview'] ?? '',
      voteAverage: map['vote_average']?.toInt() ?? 0,
      voteCount: map['vote_count']?.toInt() ?? 0,
      airDate: map['air_date'] ?? '',
      episodeNumber: map['episode_number']?.toInt() ?? 0,
      productionCode: map['production_code'] ?? '',
      runtime: map['season_number']?.toInt() ?? 0,
      seasonNumber: map['seasonNumber']?.toInt() ?? 0,
      showId: map['show_id']?.toInt() ?? 0,
      stillPath: map['still_path'] ?? '',
    );
  }
}
