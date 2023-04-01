class VideosModel {
  final List<ResultModel> results;
  VideosModel({
    required this.results,
  });

  factory VideosModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return VideosModel(
      results: List<ResultModel>.from(
          map['results'].map((x) => ResultModel.fromMap(x))),
    );
  }
}

class ResultModel {
  final String iso6391;
  final String iso31661;

  final String name;
  final String key;
  final String publishedAt;
  final String site;
  final int size;
  final String type;
  final bool official;
  final String id;
  ResultModel({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.publishedAt,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.id,
  });

  factory ResultModel.fromMap(Map<String, dynamic> map) {
    return ResultModel(
      iso6391: map['iso6391'] ?? '',
      iso31661: map['iso31661'] ?? '',
      name: map['name'] ?? '',
      key: map['key'] ?? '',
      publishedAt: map['publishedAt'] ?? '',
      site: map['site'] ?? '',
      size: map['size']?.toInt() ?? 0,
      type: map['type'] ?? '',
      official: map['official'] ?? false,
      id: map['id'] ?? '',
    );
  }
}
