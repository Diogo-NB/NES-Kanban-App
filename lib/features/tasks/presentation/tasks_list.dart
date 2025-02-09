import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nes_ui/nes_ui.dart';

class TasksList extends ConsumerStatefulWidget {
  final String tabId;
  const TasksList({super.key, required this.tabId});

  @override
  ConsumerState createState() => _TasksListState();
}

class _TasksListState extends ConsumerState<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      children: [
        NesContainer(
          child: Text('Task 1'),
        ),
      ],
    );
  }
}
