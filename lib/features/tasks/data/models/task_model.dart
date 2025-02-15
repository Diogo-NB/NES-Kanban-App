import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
class TaskModel with _$TaskModel {
  @Assert('id.isNotEmpty')
  @Assert('tabId.isNotEmpty')
  @Assert('title.isNotEmpty')
  factory TaskModel({
    required String id,
    required String tabId,
    required String title,
    DateTime? deadline,
    String? description,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, Object?> json) =>
      _$TaskModelFromJson(json);
}
