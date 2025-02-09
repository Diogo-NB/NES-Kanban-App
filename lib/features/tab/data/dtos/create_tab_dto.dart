import 'package:json_annotation/json_annotation.dart';
import 'package:nes_kanban_app/chopper/chopper_dto.dart';
import 'package:nes_kanban_app/features/tab/data/models/tab_icon.dart';

part 'create_tab_dto.g.dart';

@JsonSerializable()
class CreateTabDto implements ChopperDto {
  final String title;
  final int order;
  final TabIconEnum icon;

  CreateTabDto({
    required this.title,
    this.order = 0,
    this.icon = TabIconEnum.defaultTabIcon,
  });

  factory CreateTabDto.fromJson(Map<String, dynamic> json) =>
      _$CreateTabDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CreateTabDtoToJson(this);
}
