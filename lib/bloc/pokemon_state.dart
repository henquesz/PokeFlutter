import 'package:pokedex/pokemon_page_response.dart';

abstract class PokemonState {}

class PokemonLoadInProgress extends PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoadSuccess extends PokemonState {
  final List<PokemonList> pokemonListing;
  final bool canLoadNextPage;

  PokemonLoadSuccess(
      {required this.pokemonListing, required this.canLoadNextPage});
}

class PokemonLoadFailed extends PokemonState {
  final Error error;

  PokemonLoadFailed({required this.error});
}
