import 'package:flutter/material.dart';
import 'package:flutter_test_project/core/constants/app_dictionary.dart';
import 'package:flutter_test_project/features/home/domain/entities/pokemon_details.dart';
import 'package:flutter_test_project/theme/app_colors.dart';

class BaseStatsSection extends StatelessWidget {
  final PokemonDetails pokemonDetails;
  final Color pokemonType;
  final int hp;
  final int atk;
  final int def;
  final int satk;
  final int sdef;
  final int spd;
  const BaseStatsSection({
    super.key,
    required this.pokemonDetails,
    required this.pokemonType,
    required this.hp,
    required this.atk,
    required this.def,
    required this.satk,
    required this.sdef,
    required this.spd,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FixedColumnWidth(45),
      },
      border: TableBorder(
        verticalInside: BorderSide(
          width: 1,
          color: AppColors.grayScaleLight,
        ),
      ),
      children: [
        _buildStatRow(AppDictionary.hp, hp),
        _buildStatRow(AppDictionary.atk, atk),
        _buildStatRow(AppDictionary.def, def),
        _buildStatRow(AppDictionary.satk, satk),
        _buildStatRow(AppDictionary.sdef, sdef),
        _buildStatRow(AppDictionary.spd, spd),
      ],
    );
  }

  TableRow _buildStatRow(String label, int value) {
    final progress = value / 100.0;
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: pokemonType,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            children: [
              SizedBox(
                  width: 40,
                  child: Text(
                    '$value',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: AppColors.grayScaleDark,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
              const SizedBox(width: 8),
              Expanded(
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: pokemonType.withOpacity(.2),
                  color: pokemonType,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
