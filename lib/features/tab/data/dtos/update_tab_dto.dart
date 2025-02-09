import 'package:json_annotation/json_annotation.dart';
import 'package:nes_kanban_app/chopper/chopper_dto.dart';

part 'update_tab_dto.g.dart';

@JsonSerializable()
class UpdateTabDto implements ChopperDto {
  @JsonKey(required: true)
  final String id;

  @JsonKey(disallowNullValue: true)
  final String? title;

  @JsonKey(disallowNullValue: true)
  final int? order;

  UpdateTabDto({
    required this.id,
    this.title,
    this.order,
  });

  factory UpdateTabDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateTabDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UpdateTabDtoToJson(this);
}
