import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pokemon_go/constants/api_constants.dart';
import 'package:pokemon_go/core/exceptions/app_error.dart';
import 'package:pokemon_go/core/models/PokemonModel/PokemonModel.dart';
import 'package:pokemon_go/utils/common_utils.dart';

import 'network.dart';

class PokemonDetailService {
  static final Dio _dio = NetworkUtils.createDioInstance();

  /// use this  function if you need intercept something in your api
  // PokemonDetailService() {
  //   final headerInterceptor = generateHeaderInterceptor(_dio);
  //   _dio.interceptors.add(
  //     headerInterceptor,
  //   );
  // }
  // final Dio _dio = Dio();

  Future<Either<AppError, List<Results>?>> getPokemon(int limit) async {
    try {
      dPrint("RequestedBaseUrl:${AppConstants.baseUrl}");
      dPrint("requestedUrl:${AppConstants.baseUrl}");
      final response = await _dio.get(
        AppConstants.baseUrl,
        queryParameters: {
          "limit": AppConstants.PAGE_SIZE,
          "offset": limit * AppConstants.PAGE_SIZE
        },
      );
      dPrint(
          "Requested Respond From ${AppConstants.baseUrl} is ::: ${response.data}");
      final pokemonRespond = Pokemon.fromJson(response.data);
      dPrint("respond After json Parsing :${pokemonRespond.results![1].name}");

      return Right(pokemonRespond.results);
    } catch (e) {
      dPrint('Error while fetching  data:$e');
      return Left(
        AppError(message: 'Error while fetching  data'),
      );
    }
  }

  Future<Either<AppError, Map<String, dynamic>>> getPokemonDetails(
      String pokemonName) async {
    try {
      dPrint("RequestedBaseUrl:${AppConstants.baseUrl}");
      final url = '${AppConstants.baseUrl}/$pokemonName';
      dPrint("requestedUrl:$url");
      final response = await _dio.get(
        url,
      );
      dPrint("Requested Respond From $url is ::: ${response.data}");
      return Right(response.data);
    } catch (e) {
      dPrint('Error while fetching  data:$e');
      return Left(
        AppError(message: 'Error while fetching  data'),
      );
    }
  }
}
