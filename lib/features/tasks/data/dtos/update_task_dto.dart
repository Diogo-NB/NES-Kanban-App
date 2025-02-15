import 'package:json_annotation/json_annotation.dart';
import 'package:nes_kanban_app/chopper/chopper_dto.dart';

part 'update_task_dto.g.dart';

@JsonSerializable()
class UpdateTaskDto implements ChopperDto {
  final String id, tabId;
  final String? title, description;
  final DateTime? deadline;

  UpdateTaskDto({
    required this.id,
    required this.tabId,
    this.title,
    this.description,
    this.deadline,
  });

  factory UpdateTaskDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateTaskDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UpdateTaskDtoToJson(this);
}
