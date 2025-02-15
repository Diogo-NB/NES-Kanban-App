import 'package:json_annotation/json_annotation.dart';
import 'package:nes_kanban_app/chopper/chopper_dto.dart';

part 'create_task_dto.g.dart';

@JsonSerializable()
class CreateTaskDto implements ChopperDto {
  final String tabId, title;
  final String? description;
  final DateTime? deadline;

  CreateTaskDto({
    required this.tabId,
    required this.title,
    this.description,
    this.deadline,
  });

  factory CreateTaskDto.fromJson(Map<String, dynamic> json) =>
      _$CreateTaskDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CreateTaskDtoToJson(this);
}
