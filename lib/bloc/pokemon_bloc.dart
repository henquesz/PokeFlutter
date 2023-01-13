import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemon_event.dart';
import 'package:pokedex/bloc/pokemon_state.dart';
import 'package:pokedex/pokemon_repository.dart';

// class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
//   final _pokemonRepository = PokemonRepository();

//   PokemonBloc() : super(PokemonInitial());

//   Stream<PokemonState> mapEventToState(PokemonEvent event) async* {
//     if (event is PokemonPageRequest) {
//       yield PokemonLoadInProgress();
//       try {
//         final pokemonPageResponse =
//             await _pokemonRepository.getPokemonPage(event.page);
//         yield PokemonLoadSuccess(
//             pokemonListing: pokemonPageResponse.pokemonListing,
//             canLoadNextPage: pokemonPageResponse.canLoadNextPage);
//       } on Error catch (e) {
//         yield PokemonLoadFailed(error: e);
//       }
//     }
//   }
// }

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonPageRequest>(_onpokemonRepository);
  }

  final _pokemonRepository = PokemonRepository();

  void _onpokemonRepository(
      PokemonPageRequest event, Emitter<PokemonState> emit) async {
    emit(PokemonLoadInProgress());
    try {
      final pokemonPageResponse =
          await _pokemonRepository.getPokemonPage(event.page);
      emit(PokemonLoadSuccess(
          pokemonListing: pokemonPageResponse.pokemonListing,
          canLoadNextPage: pokemonPageResponse.canLoadNextPage));
    } on Error catch (e) {
      emit(PokemonLoadFailed(error: e));
    }
  }
}
