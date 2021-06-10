import 'package:pokemonmvvm/api.dart';
import 'package:pokemonmvvm/pokemon.dart';

class PokeModel {
  Future<Pokemon> _pokemon; //vai guardar os dados

  Future<Pokemon> get pokemon => _pokemon; //função get

  fetchPokemon(int number) {
    _pokemon = API().fetchPokemon(number); //Pega os dados da api
  }
}
