import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nes_kanban_app/chopper/chopper.dart';
import 'package:nes_kanban_app/features/tasks/data/dtos/create_task_dto.dart';
import 'package:nes_kanban_app/features/tasks/data/dtos/update_task_dto.dart';
import 'package:nes_kanban_app/features/tasks/data/models/task_model.dart';
import 'package:nes_kanban_app/features/tasks/data/task_service.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  return TaskRepository(
    taskService: ref.read(chopperProvider).getService<TaskService>(),
  );
});

class TaskRepository {
  final TaskService _taskService;

  TaskRepository({required TaskService taskService})
      : _taskService = taskService;

  Future<List<TaskModel>> findByTab({required String tabId}) async {
    final res = await _taskService.findByTab(tabId);

    return res.body ?? [];
  }

  Future<TaskModel> createTask({
    required String title,
    required String description,
    required String tabId,
  }) async {
    final res = await _taskService.createTask(CreateTaskDto(
      title: title,
      description: description,
      tabId: tabId,
    ));
    return res.bodyOrThrow;
  }

  Future<void> updateTask({
    required String id,
    required String title,
    required String description,
    required String tabId,
  }) async {
    final res = await _taskService.updateTask(UpdateTaskDto(
      id: id,
      title: title,
      description: description,
      tabId: tabId,
    ));

    if (res.error != null) {
      throw Exception('Failed to update task');
    }
  }
}
