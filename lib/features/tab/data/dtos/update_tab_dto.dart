import 'package:json_annotation/json_annotation.dart';
import 'package:nes_kanban_app/chopper/chopper_dto.dart';
import 'package:nes_kanban_app/features/tab/data/models/tab_icon.dart';

part 'update_tab_dto.g.dart';

@JsonSerializable()
class UpdateTabDto implements ChopperDto {
  @JsonKey(required: true)
  final String id;

  @JsonKey(disallowNullValue: true)
  final String? title;

  @JsonKey(disallowNullValue: true)
  final int? order;

  @JsonKey(disallowNullValue: true)
  final TabIconEnum? icon;

  UpdateTabDto({
    required this.id,
    this.title,
    this.order,
    this.icon,
  });

  factory UpdateTabDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateTabDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UpdateTabDtoToJson(this);
}
