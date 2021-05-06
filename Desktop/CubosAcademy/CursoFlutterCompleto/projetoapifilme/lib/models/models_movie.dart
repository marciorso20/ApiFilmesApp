import 'package:projetoapifilme/apifilme.dart';
import 'package:projetoapifilme/filmes.dart';

class MovieModel {
  Future<Filme> _movie;

  Future<Filme> get movie => _movie;

  fetchFilme() {
    _movie = API().fetchFilme();
  }
}
