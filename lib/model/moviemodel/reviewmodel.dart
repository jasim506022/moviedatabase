

class ReviewModels {
  final List<AuthorDetails> results;
  
  ReviewModels( {
   required this.results,


  });

  factory ReviewModels.fromMap(Map<String, dynamic> map) {
    return ReviewModels(
      results: List<AuthorDetails>.from(
              map['results'].map((x) => AuthorDetails.fromMap(x))), 
          

    );
  }
}

class AuthorDetails {
  final String name;
  final String username;
  final String avatarPath;
  final double rating;
  final String content;
  AuthorDetails({
    required this.name,
    required this.username,
    required this.avatarPath,
    required this.rating,
       required this.content,
  });

  factory AuthorDetails.fromMap(Map<String, dynamic> map) {
    return AuthorDetails(
      name: map['author_details']['name'] ?? '',
      username: map['author_details']['username'] ?? '',
      avatarPath: map['author_details']['avatar_path'] ?? '',
      rating: map['author_details']['rating']?.toDouble() ?? 0.0,
      content: map['content']
    );
  }
}
