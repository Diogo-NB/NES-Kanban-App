import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nes_kanban_app/features/tab/data/models/tab_model.dart';

part 'home_screen_state.freezed.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  const HomeScreenState._();

  const factory HomeScreenState({
    @Default(AsyncLoading()) AsyncValue<List<TabModel>> tabs,
    @Default(0) int currentTabIndex,
  }) = _HomeScreenState;

  String get currentTabId => tabs.requireValue[currentTabIndex].id;
}
