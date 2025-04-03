import 'package:flutter/material.dart';
import 'package:flutter_test_project/core/constants/app_assets.dart';
import 'package:flutter_test_project/core/constants/app_dictionary.dart';
import 'package:flutter_test_project/core/extensions/num_extensions.dart';
import 'package:flutter_test_project/theme/app_colors.dart';

class AboutTable extends StatelessWidget {
  final String kg;
  final String m;
  final String moves;
  final Color pokemonType;

  const AboutTable({
    super.key,
    required this.kg,
    required this.m,
    required this.moves,
    required this.pokemonType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppDictionary.about,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: pokemonType,
              fontWeight: FontWeight.w700,
            ),
          ),
          16.ph,
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: buildCell(
                    icon: Image.asset(AppAssets.weightIcon, height: 16),
                    value: '$kg kg',
                    label: AppDictionary.weight,
                  ),
                ),
                VerticalDivider(
                  thickness: 1,
                  width: 1,
                  color: AppColors.grayScaleLight,
                ),
                Expanded(
                  child: buildCell(
                    icon: RotatedBox(
                        quarterTurns: 1,
                        child:
                            Image.asset(AppAssets.straightenIcon, height: 16)),
                    value: '$m m',
                    label: AppDictionary.height,
                  ),
                ),
                VerticalDivider(
                  thickness: 1,
                  width: 1,
                  color: AppColors.grayScaleLight,
                ),
                Expanded(
                  child: buildCell(
                    value: moves,
                    label: AppDictionary.moves,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCell({
    Widget? icon,
    required String value,
    required String label,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: icon,
              ),
              4.pw,
            ],
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  value,
                  maxLines: null,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColors.grayScaleDark,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 8,
            color: AppColors.grayScaleMedium,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
