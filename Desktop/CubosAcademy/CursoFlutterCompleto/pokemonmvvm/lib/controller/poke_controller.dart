import 'dart:async';
import 'dart:math';

import 'package:pokemonmvvm/models/poke_model.dart';
import 'package:pokemonmvvm/pokemon.dart';

class PokeController {
  final model = PokeModel();

  Future<Pokemon> get pokemon => model.pokemon;

  //stream
  StreamController<Pokemon> streamLista = StreamController();

  loadPokemon() {
    model.fetchPokemon(Random().nextInt(1000));
    model.pokemon.then((value) {
      streamLista.add(value);
    });
  }
}
