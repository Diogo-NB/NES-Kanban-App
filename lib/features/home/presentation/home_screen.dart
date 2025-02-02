import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nes_kanban_app/features/auth/domain/auth_repository.dart';
import 'package:nes_kanban_app/features/home/presentation/components/tasks_list.dart';
import 'package:nes_ui/nes_ui.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = [
    Tab(
      text: 'TODO',
      icon: NesIcon(iconData: NesIcons.textFile),
    ),
    Tab(
      text: 'DOING',
      icon: NesIcon(iconData: NesIcons.play),
    ),
    Tab(
      text: 'DONE',
      icon: NesIcon(iconData: NesIcons.check),
    ),
  ];

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: myTabs.length,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
        actions: [
          IconButton(
            icon: NesIcon(iconData: NesIcons.close),
            onPressed: () async {
              await ref.read(authRepositoryProvider).signout();
              if (context.mounted) {
                context.go('/signin');
              }
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) => TasksList()).toList(),
      ),
    );
  }
}
