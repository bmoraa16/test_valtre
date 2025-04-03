import 'package:flutter/material.dart';
import 'package:flutter_test_project/core/constants/app_dictionary.dart';
import 'package:flutter_test_project/theme/app_colors.dart';

class LoadMoreButton extends StatelessWidget {
  final bool canLoadMore;
  final bool isLoadingMore;
  final VoidCallback onPressed;

  const LoadMoreButton({
    super.key,
    required this.canLoadMore,
    required this.isLoadingMore,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.pokemonTypeFire,
        disabledBackgroundColor: AppColors.pokemonTypeFire,
        foregroundColor: AppColors.pokemonTypeFire,
        disabledForegroundColor: AppColors.pokemonTypeFire,
        shadowColor: AppColors.pokemonTypeFire,
        surfaceTintColor: AppColors.pokemonTypeFire,
      ),
      onPressed: canLoadMore && !isLoadingMore ? onPressed : null,
      child: isLoadingMore
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.hbRedPrimary,
              ),
            )
          : const Text(
              AppDictionary.loadMore,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}
