import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nes_kanban_app/features/tasks/presentation/tasks_list_view_model.dart';

class CreateTaskFab extends ConsumerWidget {
  final String tabId;
  const CreateTaskFab({super.key, required this.tabId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksViewModel = ref.read(tasksListViewModelProvider(tabId).notifier);

    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        tasksViewModel.createTask();
      },
    );
  }
}
