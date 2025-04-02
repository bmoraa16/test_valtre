import 'package:equatable/equatable.dart';
import 'package:flutter_test_project/features/home/domain/entities/pokemon_result.dart';

class PokemonResponse extends Equatable {
  final int count;
  final String? next;
  final String? previous;
  final List<PokemonResult> results;

  const PokemonResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  PokemonResponse copyWith({
    int? count,
    String? next,
    String? previous,
    List<PokemonResult>? results,
  }) {
    return PokemonResponse(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }

  @override
  List<Object?> get props => [count, next, previous, results];
}
