import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nes_kanban_app/features/tasks/data/models/task_model.dart';
import 'package:nes_kanban_app/features/tasks/domain/task_repository.dart';
import 'package:nes_kanban_app/features/tasks/presentation/tasks_list_state.dart';

final tasksListViewModelProvider = AutoDisposeNotifierProviderFamily<
    TasksListViewModel, TasksListState, String>(TasksListViewModel.new);

class TasksListViewModel
    extends AutoDisposeFamilyNotifier<TasksListState, String> {
  late TaskRepository _repository;

  @override
  TasksListState build(String arg) {
    final tabId = arg;
    _repository = ref.read(taskRepositoryProvider);

    return TasksListState(tabId: tabId);
  }

  Future<List<TaskModel>> _fetchTasks() async {
    return _repository.findByTab(tabId: state.tabId);
  }

  Future<void> fetchTasks() async {
    state = state.copyWith(tasks: AsyncValue.loading());

    final tasks = await AsyncValue.guard(_fetchTasks);

    state = state.copyWith(tasks: tasks);
  }

  // TODO - FINISH CREATE TASK
  Future<TaskModel> createTask() async {
    final newTask = await _repository.createTask(
      title: 'Title2',
      description: 'Description2',
      tabId: state.tabId,
    );

    fetchTasks();

    return newTask;
  }
}
