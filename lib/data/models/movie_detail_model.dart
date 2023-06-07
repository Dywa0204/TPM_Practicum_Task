class MovieDetailModel {
  final String imdbID;
  final String Title;
  final String Released;
  final String Genre;
  final String Poster;
  final String Writer;
  final String Actors;
  final String Plot;
  final String imdbRating;

  MovieDetailModel({
    required this.imdbID,
    required this.Title,
    required this.Released,
    required this.Genre,
    required this.Poster,
    required this.Writer,
    required this.Actors,
    required this.Plot,
    required this.imdbRating
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      imdbID: json['imdbID'],
      Title: json['Title'],
      Released: json["Released"],
      Genre: json["Genre"],
      Poster: json["Poster"],
      Writer: json['Writer'],
      Actors: json["Actors"],
      Plot: json["Plot"],
      imdbRating: json["imdbRating"],
    );
  }

  Map<String, dynamic> toJson() => {
    'imdbID': imdbID,
    'Title': Title,
    'Released': Released,
    'Genre': Genre,
    'Poster': Poster,
    'Writer': Writer,
    'Actors': Actors,
    'Plot': Plot,
    'imdbRating': imdbRating,
  };
}