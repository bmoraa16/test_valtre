import 'package:json_annotation/json_annotation.dart';

part 'named_api_resource_dto.g.dart';

@JsonSerializable()
class NamedApiResourceDto {
  final String name;
  final String url;

  const NamedApiResourceDto({
    required this.name,
    required this.url,
  });

  factory NamedApiResourceDto.fromJson(Map<String, dynamic> json) =>
      _$NamedApiResourceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NamedApiResourceDtoToJson(this);
}
