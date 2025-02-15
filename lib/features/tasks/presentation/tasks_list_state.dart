import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nes_kanban_app/features/tasks/data/models/task_model.dart';

part 'tasks_list_state.freezed.dart';

@freezed
class TasksListState with _$TasksListState {
  const TasksListState._();

  const factory TasksListState({
    required String tabId,
    @Default(AsyncLoading()) AsyncValue<List<TaskModel>> tasks,
  }) = _TasksListState;
}
