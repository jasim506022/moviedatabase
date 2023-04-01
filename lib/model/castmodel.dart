class Credits {
  final List<CastModel> cast;
  Credits({
    required this.cast,
  });

  factory Credits.fromMap(Map<String, dynamic> map) {
    return Credits(
      cast: List<CastModel>.from(map['cast']?.map((x) => CastModel.fromMap(x))),
    );
  }
}

class CastModel {
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String profilePath;

  final String character;
  final String creditId;
  final int order;
  CastModel({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.character,
    required this.creditId,
    required this.order,
  });
  factory CastModel.fromMap(Map<String, dynamic> map) {
    return CastModel(
      adult: map['adult'] ?? false,
      gender: map['gender']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      knownForDepartment: map['known_for_department'] ?? '',
      name: map['name'] ?? '',
      originalName: map['original_name'] ?? '',
      popularity: map['popularity']?.toDouble() ?? 0.0,
      profilePath: map['profile_path'] ?? '',

      character: map['character'] ?? '',
      creditId: map['credit_id'] ?? '',
      order: map['order']?.toInt() ?? 0,

      //    adult: map['cast']['adult'] ?? false,
      // gender: map['cast']['gender']?.toInt() ?? 0,
      // id: map['cast']['id']?.toInt() ?? 0,
      // knownForDepartment: map['cast']['known_for_department'] ?? '',
      // name: map['cast']['name'] ?? '',
      // originalName: map['cast']['original_name'] ?? '',
      // popularity: map['cast']['popularity']?.toDouble() ?? 0.0,
      // profilePath: map['cast']['profile_path'] ?? '',
      // CastModelId: map['cast']['cast_id']?.toInt() ?? 0,
      // character: map['cast']['character'] ?? '',
      // creditId: map['cast']['credit_id'] ?? '',
      // order: map['cast']['order']?.toInt() ?? 0,
    );
  }
}
