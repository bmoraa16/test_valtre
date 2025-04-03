import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_project/core/constants/app_assets.dart';
import 'package:flutter_test_project/core/constants/app_dictionary.dart';
import 'package:flutter_test_project/features/home/presentation/bloc/get_pokemon_list_bloc.dart';
import 'package:flutter_test_project/theme/app_colors.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final SortType currentSortType;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onSortTap;

  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.currentSortType,
    required this.onSearchChanged,
    required this.onSortTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    AppAssets.searchIconSvg,
                    height: 22,
                    colorFilter: ColorFilter.mode(
                      AppColors.hbRedPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                  highlightColor: Colors.transparent,
                ),
                hintText: AppDictionary.search,
                hintStyle: TextStyle(
                  color: AppColors.grayScaleMedium,
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.zero,
              ),
              onChanged: onSearchChanged,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: SvgPicture.asset(
              _iconForSortType(currentSortType),
              height: 22,
              colorFilter: ColorFilter.mode(
                AppColors.hbRedPrimary,
                BlendMode.srcIn,
              ),
            ),
            onPressed: onSortTap,
          ),
        ),
      ],
    );
  }

  String _iconForSortType(SortType type) {
    switch (type) {
      case SortType.none:
        return AppAssets.sortIconSvg;
      case SortType.number:
        return AppAssets.tagIconSvg;
      case SortType.name:
        return AppAssets.textFormatIconSvg;
    }
  }
}
