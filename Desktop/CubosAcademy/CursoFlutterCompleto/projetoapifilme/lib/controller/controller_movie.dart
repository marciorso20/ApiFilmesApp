import 'package:projetoapifilme/filmes.dart';
import 'package:projetoapifilme/models/models_movie.dart';

class MovieController {
  final model = MovieModel();

  Future<Filme> get movie => model.movie;

  loadMovie() {
    model.fetchFilme();
  }
}
