import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokemon_go/constants/api_constants.dart';
import 'package:pokemon_go/core/locator/locator.dart';
import 'package:pokemon_go/core/models/PokemonModel/pokemon_list_model.dart';
import 'package:pokemon_go/core/services/rest_api/pokemon_detail_service.dart';
import 'package:pokemon_go/utils/common_utils.dart';

import 'home_view_state.dart';

class HomeViewModel extends StateNotifier<HomeViewModelState> {
  HomeViewModel()
      : super(
          HomeViewModelState(
            isError: false,
            isLoading: false,
            isSuccess: false,
            pokemonListModel: [],
            imageUrl: 'assets/test.png',
            imageName: 'Ramu',
            hasMoreItems: false,
            isSearching: false,
          ),
        );
  final pokemonServices = locator<PokemonDetailService>();
  final _searchController = TextEditingController();
  late bool isSearchStarting = true;
  late List<PokemonListModel>? cachedListOfPokemon = [];

  TextEditingController get searchTextController => _searchController;

  Future<void> init() async {
    await getPokemon(0);
  }

  Future<void> searchPokemon(String keyWord) async {
    List<PokemonListModel>? listToSearch = [];
    if (isSearchStarting) {
      listToSearch = state.pokemonListModel;
    } else {
      listToSearch = cachedListOfPokemon;
    }
    if (keyWord.isEmpty) {
      dPrint("isEmpty triggered");
      // state.pokemonListModel = state.cachedListOfPokemon;
      state = HomeViewModelState(
        isLoading: false,
        isError: false,
        isSuccess: true,
        pokemonListModel: cachedListOfPokemon,
        isSearching: false,
      );
      isSearchStarting = true;
    } else {
      if (listToSearch != null) {
        List<PokemonListModel> result = listToSearch
            .where((element) => element.pokemonName.contains(keyWord))
            .toList();
        dPrint("searchedResult : $result");
        if (isSearchStarting) {
          dPrint("isSearchedStartingTriggered");
          state = HomeViewModelState(
              isLoading: false,
              isError: false,
              isSuccess: true,
              isSearching: false,
              pokemonListModel: state.pokemonListModel);
          isSearchStarting = false;
          cachedListOfPokemon = state.pokemonListModel;
        }
        dPrint("nothingTriggered0");
        state = HomeViewModelState(
          isLoading: false,
          isError: false,
          isSuccess: true,
          pokemonListModel: result,
          isSearching: true,
        );
        dPrint("ResultUpdated :${state.pokemonListModel}");
      }
    }
  }

  int? getImageNumber(String url) {
    int? number;
    try {
      if (url.endsWith("/")) {
        url = url.substring(0, url.length - 1);
      }
      List<String> urlParts = url.split('/');
      String lastPart = urlParts.last;
      number = int.tryParse(lastPart);
    } catch (e) {
      dPrint('failed to find the number in url');
    }
    return number;
  }

  Future<void> getPokemon(int limit) async {
    dPrint("YOu are calling pokemon APi :: $limit");
    if (limit <= 0) {
      state = await HomeViewModelState(
        isLoading: true,
        isError: false,
        isSuccess: false,
        hasMoreItems: false,
      );
    } else {
      state = await HomeViewModelState(
        isLoading: true,
        isError: false,
        isSuccess: false,
        hasMoreItems: false,
        pokemonListModel: state.pokemonListModel,
      );
    }
    try {
      final pokemonList = await pokemonServices.getPokemon(limit);
      pokemonList.fold((error) {
        state = HomeViewModelState(
          isLoading: false,
          isSuccess: false,
          isError: true,
        );
      }, (success) async {
        List<PokemonListModel> paginatedData = [];
        List<PokemonListModel> data = [];
        if (success != null && success.isNotEmpty) {
          for (int index = 0; index < success.length; index++) {
            final number = getImageNumber(success[index].url ??
                ''); //this will extract the number from url
            final String imageUrl =
                '${AppConstants.imageConstants}/$number.png';
            dPrint('ImageUrlOfPokemon:$imageUrl}');

            data.add(
              PokemonListModel(
                pokemonName: success[index].name ?? '',
                imageUrl: imageUrl,
                number: number ?? 0,
              ),
            );
          }
          dPrint("listOfPokemonWithImageURl:${data.length}");
          if (limit <= 0) {
            paginatedData = [...data];
          } else {
            paginatedData = [
              ...?state.pokemonListModel,
              ...data,
            ];
          }
          dPrint("ListOfPaginatedData:${paginatedData.length}");

          state = await HomeViewModelState(
            isLoading: false,
            isSuccess: true,
            pokemonListModel: paginatedData,
            isError: false,
          );
        }
      });
    } catch (e) {
      dPrint("Failed to fetch pokemon data");
      state = await HomeViewModelState(
        isLoading: false,
        isSuccess: false,
        isError: true,
      );
    }
  }
}
