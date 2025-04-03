import 'package:flutter/material.dart';
import 'package:flutter_test_project/core/extensions/string_extensions.dart';

abstract class AppColors {
  static final Color hbWhite = "#FFFDFAFC".toColor();
  static final Color hbBlue = "#503d76".toColor();
  static final Color hbBlueAccent = "#8A4ABD".toColor();
  static final Color hbPink = "#FC3894".toColor();
  static final Color hbGreen = "#1FC690".toColor();
  static final Color hbGrey = "#666680".toColor();
  static final Color hbGreyAccent = "#FDFAFC".toColor();
  static final Color hbBluishGrey = "#b2b3d5".toColor();
  static final Color hbGreyText = "#b2b3d5".toColor();
  static final Color hbGreySecondary = "#eae3ee".toColor();
  static final Color hbVioletText = "#956fab".toColor();
  static final Color hbGreyBackground = "#d5d6e9".toColor();
  static final Color hbRed = "#ed3a4e".toColor();
  static final Color hbBlueText = "#3a2a5d".toColor();
  static final Color hbRedPrimary = "#DC0A2D".toColor();
  static final Color pokemonTypeBug = "#A7B723".toColor();
  static final Color pokemonTypeDark = "#75574C".toColor();
  static final Color pokemonTypeDragon = "#7037FF".toColor();
  static final Color pokemonTypeEletric = "#F9CF30".toColor();
  static final Color pokemonTypeFairy = "#E69EAC".toColor();
  static final Color pokemonTypeFighting = "#C12239".toColor();
  static final Color pokemonTypeFire = "#F57D31".toColor();
  static final Color pokemonTypeFlying = "#A891EC".toColor();
  static final Color pokemonTypeGhost = "#70559B".toColor();
  static final Color pokemonTypeNormal = "#AAA67F".toColor();
  static final Color pokemonTypeGrass = "#74CB48".toColor();
  static final Color pokemonTypeGround = "#DEC16B".toColor();
  static final Color pokemonTypeIce = "#9AD6DF".toColor();
  static final Color pokemonTypePoison = "#A43E9E".toColor();
  static final Color pokemonTypePsychic = "#FB5584".toColor();
  static final Color pokemonTypeRock = "#B69E31".toColor();
  static final Color pokemonTypeSteel = "#B7B9D0".toColor();
  static final Color pokemonTypeWatter = "#6493EB".toColor();
  static final Color grayScaleDark = "#212121".toColor();
  static final Color grayScaleMedium = "#666666".toColor();
  static final Color grayScaleLight = "#E0E0E0".toColor();
  static final Color grayScaleBackground = "#EFEFEF".toColor();
  static final Color grayScaleWhite = "#FFFFFF".toColor();

  static List<Color> getHomeGradientColors() {
    final now = DateTime.now();
    final hour = now.hour;
    if (hour >= 6 && hour < 12) return [const Color(0xFFf0f0df), Colors.white];
    if (hour >= 12 && hour < 18) return [const Color(0xFFd8eaea), Colors.white];
    if (hour >= 18 && hour < 21) return [const Color(0xFFede3de), Colors.white];
    return [const Color(0xFFd6d9eb), Colors.white];
  }

// Gradients
  static final rxCardGradientColors = [
    hbBlue,
    hbBlue,
    hbBlue,
    hbPink,
    hbPink,
    hbPink,
  ];
}

class PokemonTypeColorMapper {
  static Color getColorFromType(String type) {
    switch (type.toLowerCase()) {
      case 'bug':
        return AppColors.pokemonTypeBug;
      case 'dark':
        return AppColors.pokemonTypeDark;
      case 'dragon':
        return AppColors.pokemonTypeDragon;
      case 'electric':
        return AppColors.pokemonTypeEletric;
      case 'fairy':
        return AppColors.pokemonTypeFairy;
      case 'fighting':
        return AppColors.pokemonTypeFighting;
      case 'fire':
        return AppColors.pokemonTypeFire;
      case 'flying':
        return AppColors.pokemonTypeFlying;
      case 'ghost':
        return AppColors.pokemonTypeGhost;
      case 'normal':
        return AppColors.pokemonTypeNormal;
      case 'grass':
        return AppColors.pokemonTypeGrass;
      case 'ground':
        return AppColors.pokemonTypeGround;
      case 'ice':
        return AppColors.pokemonTypeIce;
      case 'poison':
        return AppColors.pokemonTypePoison;
      case 'psychic':
        return AppColors.pokemonTypePsychic;
      case 'rock':
        return AppColors.pokemonTypeRock;
      case 'steel':
        return AppColors.pokemonTypeSteel;
      case 'water':
        return AppColors.pokemonTypeWatter;
      default:
        return AppColors.hbGrey;
    }
  }
}
