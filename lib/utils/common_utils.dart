import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_go/common/ui/app_color.dart';

void dPrint(String message) {
  if (kDebugMode) {
    print('dPrint: $message');
  }
}

Color parseTypeToColor(String type) {
  final Color typeColor;
  switch (type) {
    case "normal":
      typeColor = ColorAssets.TypeNormal;
      break;
    case "fire":
      typeColor = ColorAssets.TypeFire;
      break;
    case "water":
      typeColor = ColorAssets.TypeWater;
      break;
    case "electric":
      typeColor = ColorAssets.TypeElectric;
      break;
    case "grass":
      typeColor = ColorAssets.TypeGrass;
      break;
    case "ice":
      typeColor = ColorAssets.TypeIce;
      break;
    case "fighting":
      typeColor = ColorAssets.TypeFighting;
      break;
    case "poison":
      typeColor = ColorAssets.TypePoison;
      break;
    case "ground":
      typeColor = ColorAssets.TypeGround;
      break;
    case "flying":
      typeColor = ColorAssets.TypeFlying;
      break;
    case "psychic":
      typeColor = ColorAssets.TypePsychic;
      break;
    case "bug":
      typeColor = ColorAssets.TypeBug;
      break;
    case "rock":
      typeColor = ColorAssets.TypeRock;
      break;
    case "ghost":
      typeColor = ColorAssets.TypeGhost;
      break;
    case "dragon":
      typeColor = ColorAssets.TypeDragon;
      break;
    case "dark":
      typeColor = ColorAssets.TypeDark;
      break;
    case "steel":
      typeColor = ColorAssets.TypeSteel;
      break;
    case "fairy":
      typeColor = ColorAssets.TypeFire;
      break;
    default:
      typeColor = Colors.black;
  }
  return typeColor;
}
