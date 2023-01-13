import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/pokemon_page_response.dart';

class PokemonRepository {
  final baseUrl = 'pokeapi.co';
  final client = http.Client();

  Future<PokemonPageResponse> getPokemonPage(int pageIndex) async {
    // pokemon?limit=200&offset=400.

    final queryParameters = {
      'limit': 200,
      'offset': (pageIndex * 200).toString()
    };
    final uri = Uri.https(
      baseUrl,
      '/api/v2/pokemon',
      queryParameters == null
          ? null
          : {'maxId': 0, 'minId': 0, 'count': 20}
              .map((key, value) => MapEntry(key, value.toString())),
    );
    final response = await client.get(uri);
    final json = jsonDecode(response.body);

    return PokemonPageResponse.fromJson(json);
  }
}
