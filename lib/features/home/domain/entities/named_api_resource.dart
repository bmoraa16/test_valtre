import 'package:equatable/equatable.dart';

class NamedApiResource extends Equatable {
  final String name;
  final String url;

  const NamedApiResource({
    required this.name,
    required this.url,
  });

  NamedApiResource copyWith({
    String? name,
    String? url,
  }) {
    return NamedApiResource(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  @override
  List<Object?> get props => [name, url];
}
