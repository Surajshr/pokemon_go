import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/models/PokemonModel/pokemon_list_model.dart';
import 'home_view_model.dart';

class HomeViewModelState {
  // final PokemonListModel String;
  final String? imageName;
  final String? imageUrl;
  late final List<PokemonListModel>? pokemonListModel;

  final bool isLoading;
  final bool isError;
  final bool isSuccess;
  final bool? hasMoreItems;

  final bool? isSearching;

  HomeViewModelState({
    this.pokemonListModel,
    this.imageUrl,
    this.imageName,
    required this.isLoading,
    required this.isError,
    required this.isSuccess,
    this.hasMoreItems,
    this.isSearching,

  });
}

final homeViewModelProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, HomeViewModelState>((ref) {
  return HomeViewModel();
});
