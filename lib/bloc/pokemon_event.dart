import 'package:flutter/cupertino.dart';
import 'package:pokedex/pokemon_page_response.dart';

abstract class PokemonEvent {}

class PokemonPageRequest extends PokemonEvent {
  final int page;

  PokemonPageRequest({required this.page});
}
