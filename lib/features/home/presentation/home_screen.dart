import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nes_kanban_app/features/auth/domain/auth_repository.dart';
import 'package:nes_kanban_app/features/home/presentation/components/home_tab.dart';
import 'package:nes_kanban_app/features/tasks/presentation/tasks_list.dart';
import 'package:nes_kanban_app/features/home/presentation/home_screen_view_model.dart';
import 'package:nes_ui/nes_ui.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with TickerProviderStateMixin {
  late final viewModel = ref.watch(homeScreenViewModelProvider.notifier);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.fetchTabs();
    });
  }

  @override
  Widget build(BuildContext context) {
    final tabs = ref.watch(homeScreenViewModelProvider.select((s) => s.tabs));

    final tabController = TabController(
      length: tabs.valueOrNull?.length ?? 0,
      vsync: this,
    );

    tabController.addListener(() {
      viewModel.setCurrentTabIndex(tabController.index);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('NES Kanban'),
        bottom: tabs.whenOrNull(
          skipError: true,
          data: (tabs) {
            return TabBar(
              isScrollable: tabs.length > 4,
              controller: tabController,
              tabs: tabs.map(HomeTab.new).toList(),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app_rounded),
            iconSize: 28,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: const Text('Are you sure you want to sign out?'),
                  actions: [
                    TextButton(
                      onPressed: context.pop,
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () async {
                        await ref.read(authRepositoryProvider).signout();
                        if (context.mounted) {
                          context.replace('/auth');
                        }
                      },
                      child: const Text('Sign out'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: tabs.when(
        loading: () => const Center(child: NesHourglassLoadingIndicator()),
        error: (error, stackTrace) => Center(
          child: Text('An unexpected error occurred, please try again later.'),
        ),
        data: (tabs) {
          if (tabs.isEmpty) {
            return Center(
              child: NesButton.iconText(
                type: NesButtonType.normal,
                icon: NesIcons.add,
                text: 'Created a new tab!',
                onPressed: () {
                  viewModel.createTab();
                },
              ),
            );
          }

          return Consumer(
            builder: (context, ref, child) {
              final currentTabId = ref.watch(
                homeScreenViewModelProvider.select((s) => s.currentTabId),
              );
              return TasksList(tabId: currentTabId);
            },
          );
        },
      ),
    );
  }
}
