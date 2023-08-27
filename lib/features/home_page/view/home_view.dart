import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokemon_go/common/ui/app_color.dart';
import 'package:pokemon_go/common/ui/gaps.dart';
import 'package:pokemon_go/features/home_page/logic/home_view_state.dart';
import 'package:pokemon_go/features/home_page/view/widget/pokemon_card.dart';
import 'package:pokemon_go/utils/common_utils.dart';

import '../../../common/widgets/text_field.dart';
import '../logic/home_view_model.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  late HomeViewModel viewModel;
  int page = 0;
  final _scrollController = ScrollController();

  @override
  void initState() {
    viewModel = ref.read(homeViewModelProvider.notifier)..init();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        viewModel.getPokemon(++page);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    dPrint("screenHeight $screenHeight :::: ScreenWidth : $screenWidth");
    dPrint('isThisTrue ${screenWidth > 360 && screenHeight > 692}');
    int crossAxisCount = screenWidth > 500 && screenHeight > 693 ? 4 : 2;
    dPrint("crossAxisCount :$crossAxisCount");
    final state = ref.watch(homeViewModelProvider);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              PokemonTextField(
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    size: 10.sp,
                    Icons.search_outlined,
                    color: ColorAssets.onBackground,
                  ),
                ),
                keyBoardType: TextInputType.text,
                controller: viewModel.searchTextController,
                onChanged: viewModel.searchPokemon,
                labelText: 'Search pokemon',
                onFieldSubmitted: (value) {},
              ),
              gapH12,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (state.isLoading)
                        const Align(
                          alignment: Alignment.center,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      if (state.isSuccess)
                        SizedBox(
                          height: .9.sh,
                          child: GridView.builder(
                            keyboardDismissBehavior:
                                ScrollViewKeyboardDismissBehavior.onDrag,
                            controller: _scrollController,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              // mainAxisSpacing: 10.h,
                              mainAxisExtent: 200.h,
                              crossAxisCount: crossAxisCount,
                            ),
                            itemCount: state.pokemonListModel?.length ?? 1,
                            itemBuilder: (context, index) {
                              final pokemon = state.pokemonListModel?[index];
                              return pokemon != null
                                  ? Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: PokemonCardView(
                                        imageUrl: state
                                            .pokemonListModel![index].imageUrl,
                                        pokemonName: pokemon.pokemonName,
                                        pokemonID: pokemon.number,
                                      ),
                                    )
                                  : const Center(
                                      child: Text("Failed to load pokemon"));
                            },
                          ),
                        ),
                      if (state.isError)
                        Center(
                          child: Text(
                            "Failed to load pokemon",
                            style: TextStyle(
                              color: ColorAssets.error,
                              fontSize: 30.sp,
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
