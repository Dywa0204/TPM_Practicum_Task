class MovieModel {
  final String imdbID;
  final String Title;
  final String Year;
  final String Type;
  final String Poster;

  MovieModel({
    required this.imdbID,
    required this.Title,
    required this.Year,
    required this.Type,
    required this.Poster
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      imdbID: json['imdbID'],
      Title: json['Title'],
      Year: json["Year"],
      Type: json["Type"],
      Poster: json["Poster"],
    );
  }

  Map<String, dynamic> toJson() => {
    'imdbID': imdbID,
    'Title': Title,
    'Year': Year,
    'Type': Type,
    'Poster': Poster,
  };
}