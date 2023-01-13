// https://pokeapi.co/api/v2/pokemon/?offset=20&limit=20

import 'package:flutter/gestures.dart';

class PokemonList {
  final int id;
  final String name;

  String get imageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

  PokemonList({required this.id, required this.name});

  factory PokemonList.fromJson(Map<String, dynamic> json) {
    final name = json['name'] as String;
    final url = json['url'] as String;
    final id = int.parse(url.split('/')[6]);

    return PokemonList(id: id, name: name);
  }
}

class PokemonPageResponse {
  final List<PokemonList> pokemonListing;
  final bool canLoadNextPage;

  PokemonPageResponse(
      {required this.pokemonListing, required this.canLoadNextPage});

  factory PokemonPageResponse.fromJson(Map<String, dynamic> json) {
    final canLoadNextPage = json['next'] != null;
    final pokemonListing = (json['results'] as List)
        .map((listingJson) => PokemonList.fromJson(listingJson))
        .toList();
    return PokemonPageResponse(
        pokemonListing: pokemonListing, canLoadNextPage: canLoadNextPage);
  }
}
