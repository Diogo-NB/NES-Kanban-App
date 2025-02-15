import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nes_kanban_app/features/tasks/presentation/tasks_list_view_model.dart';
import 'package:nes_ui/nes_ui.dart';

class TasksList extends ConsumerStatefulWidget {
  final String tabId;
  const TasksList({super.key, required this.tabId});

  @override
  ConsumerState createState() => _TasksListState();
}

class _TasksListState extends ConsumerState<TasksList> {
  late final viewModelProvider = tasksListViewModelProvider(widget.tabId);
  late final viewModel = ref.read(viewModelProvider.notifier);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.fetchTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    late final state = ref.watch(viewModelProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: state.tasks.when(
        error: (_, __) => const Center(
          child: Text('An unexpected error occurred'),
        ),
        loading: () => const Center(child: NesHourglassLoadingIndicator()),
        data: (tasks) {
          return ListView.separated(
            itemCount: tasks.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final task = tasks[index];
              return NesContainer(
                child: ListTile(
                  title: Text(task.title),
                  subtitle: Text(task.tabId),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
