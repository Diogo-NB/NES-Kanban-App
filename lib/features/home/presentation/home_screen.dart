import 'package:flutter/material.dart';
import 'package:nes_kanban_app/features/home/presentation/components/tasks_list.dart';
import 'package:nes_ui/nes_ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
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
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) => TasksList()).toList(),
      ),
    );
  }
}
