import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nes_kanban_app/features/home/presentation/home_screen_state.dart';
import 'package:nes_kanban_app/features/tab/domain/tabs_repository.dart';

final homeScreenViewModelProvider =
    AutoDisposeNotifierProvider<HomeScreenViewModel, HomeScreenState>(
  HomeScreenViewModel.new,
);

class HomeScreenViewModel extends AutoDisposeNotifier<HomeScreenState> {
  late final TabRepository _tabRepository;

  @override
  HomeScreenState build() {
    _tabRepository = ref.read(tabRepositoryProvider);
    return HomeScreenState();
  }

  void setCurrentTabIndex(int index) {
    if (index == state.currentTabIndex) return;

    state = state.copyWith(currentTabIndex: index);
  }

  Future<void> fetchTabs() async {
    state = state.copyWith(tabs: const AsyncLoading());
    final tabs = await AsyncValue.guard(_tabRepository.getAll);
    state = state.copyWith(tabs: tabs);
  }

  Future<void> createTab() async {
    state = state.copyWith(tabs: const AsyncLoading());
    await _tabRepository.create('New Tab');
    return fetchTabs();
  }
}
