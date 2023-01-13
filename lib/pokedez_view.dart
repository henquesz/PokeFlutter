import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemon_bloc.dart';
import 'package:pokedex/bloc/pokemon_state.dart';

class PokedexView extends StatelessWidget {
  // const name({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex with bloc"),
        backgroundColor: Colors.purple,
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoadInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonLoadSuccess) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: state.pokemonListing.length,
              itemBuilder: (context, index) {
                return Card(
                  child: GridTile(
                    child: Column(children: [
                      Image.network(state.pokemonListing[index].imageUrl),
                      Text(state.pokemonListing[index].name)
                    ]),
                  ),
                );
              },
            );
          } else if (state is PokemonLoadFailed) {
            return Center(
              child: Text(state.error.toString()),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
