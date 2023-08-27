import 'package:flutter/material.dart';

class ColorAssets {
  static Color background = const Color(0xffFAFAFF);
  static Color onBackground = const Color(0xff151515);
  static Color container = const Color(0xffF3F3FF);
  static Color onContainer = const Color(0xff1D1C20);
  static Color bottomGradient = const Color(0xff364FFF);
  static Color onGradient = const Color(0xffFFFFFF);
  static Color primary = const Color(0xff845AF4);
  static Color onPrimary = const Color(0xffFBFFFE);
  static Color secondary = const Color(0xffFFc90B);
  static Color onSecondary = const Color(0xff070707);
  static Color tertiary = const Color(0xff364FFF);
  static Color onTertiary = const Color(0xffFFFFFF);
  static Color primaryVariant = const Color(0xffECE6FE);
  static Color onPrimaryVariant = const Color(0xff845BF9);
  static Color topGradient = const Color(0xff845BF9);

  static Color success = const Color(0xff048848);
  static Color onSuccess = const Color(0xffFFFFFF);
  static Color successVariant = const Color(0xffE1FFEF);
  static Color onSuccessVariant = const Color(0xff151515);
  static Color error = const Color(0xffE51B1B);
  static Color onError = const Color(0xffFFFFFF);
  static Color errorVariant = const Color(0xffFFEBEB);
  static Color onErrorVariant = const Color(0xffFFEBEB);
  static Color info = const Color(0xff2174EE);
  static Color onInfo = const Color(0xffE9ECF5);
  static Color infoVariant = const Color(0xffD0E3FF);
  static Color onInfoVariant = const Color(0xff2174EE);
  static Color disabledText = const Color(0xff6A6A6A);
  static Color disabledContainer = const Color(0xffE1E1E1);
  static Color onDisabledContainer = const Color(0xff848484);
  static Color containerVariant = const Color(0xffE8E8F9);
  static Color onContainerVariant = const Color(0xff383838);

  static Color TypeNormal = const Color(0xFFA8A77A);
  static Color TypeFire = const Color(0xFFEE8130);
  static Color TypeWater = const Color(0xFF6390F0);
  static Color TypeElectric = const Color(0xFFF7D02C);
  static Color TypeGrass = const Color(0xFF7AC74C);
  static Color TypeIce = const Color(0xFF96D9D6);
  static Color TypeFighting = const Color(0xFFC22E28);
  static Color TypePoison = const Color(0xFFA33EA1);
  static Color TypeGround = const Color(0xFFE2BF65);
  static Color TypeFlying = const Color(0xFFA98FF3);
  static Color TypePsychic = const Color(0xFFF95587);
  static Color TypeBug = const Color(0xFFA6B91A);
  static Color TypeRock = const Color(0xFFB6A136);
  static Color TypeGhost = const Color(0xFF735797);
  static Color TypeDragon = const Color(0xFF6F35FC);
  static Color TypeDark = const Color(0xFF705746);
  static Color TypeSteel = const Color(0xFFB7B7CE);
}

final appGradient = LinearGradient(
  colors: [
    ColorAssets.topGradient,
    ColorAssets.bottomGradient,
  ],
  stops: const [0, 0.88],
);
