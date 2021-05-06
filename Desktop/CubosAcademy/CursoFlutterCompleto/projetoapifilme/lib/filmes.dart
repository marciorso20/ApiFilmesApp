class Filme {
  List<Result> results;

  Filme({this.results});

  factory Filme.fromJson(Map<String, dynamic> json) => Filme(
        results: List<Result>.from(
            json["results"].map((filme) => Result.fromJson(filme))),
      );
}

class Result {
  String title;
  String posterPath;
  String releaseDate;
  String overview;

  Result({this.title, this.posterPath, this.releaseDate, this.overview});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json['title'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        overview: json['overview'],
      );
}

/**
 * Filme.fromJson(Map<String, dynamic> json) {
    var arrayFilmes = json['results'] as List;

    results = arrayFilmes.map((filme) {
      ListaFilme.fromJson(filme);
    }).toList();
  }
 */
