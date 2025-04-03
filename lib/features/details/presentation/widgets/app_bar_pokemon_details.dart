import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_project/core/constants/app_assets.dart';
import 'package:flutter_test_project/core/extensions/string_extensions.dart';
import 'package:flutter_test_project/theme/app_colors.dart';
import 'package:go_router/go_router.dart';

class AppBarHomePokemonDetails extends StatelessWidget
    implements PreferredSizeWidget {
  final String pokemonName;
  final String pokemonId;
  final Color pokemonType;
  const AppBarHomePokemonDetails({
    super.key,
    required this.pokemonName,
    required this.pokemonId,
    required this.pokemonType,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: SvgPicture.asset(
            AppAssets.arrowBackIconSvg,
            height: 30,
            colorFilter: ColorFilter.mode(
              AppColors.grayScaleWhite,
              BlendMode.srcIn,
            ),
          ),
          highlightColor: Colors.transparent,
        ),
        title: Text(
          pokemonName.toCapitalized(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              '# $pokemonId',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: AppColors.grayScaleWhite,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
