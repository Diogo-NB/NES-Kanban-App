import 'package:json_annotation/json_annotation.dart';
import 'package:nes_kanban_app/chopper/chopper_dto.dart';

part 'create_tab_dto.g.dart';

@JsonSerializable()
class CreateTabDto implements ChopperDto {
  final String title;
  final int order;

  CreateTabDto({
    required this.title,
    this.order = 0,
  });

  factory CreateTabDto.fromJson(Map<String, dynamic> json) =>
      _$CreateTabDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CreateTabDtoToJson(this);
}
