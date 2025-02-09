import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nes_kanban_app/features/tab/data/models/tab_icon.dart';

part 'tab_model.freezed.dart';
part 'tab_model.g.dart';

@freezed
class TabModel with _$TabModel {
  @Assert('id.isNotEmpty')
  @Assert('title.isNotEmpty')
  factory TabModel({
    required String id,
    required String title,
    @Default(TabIconEnum.defaultTabIcon) TabIconEnum icon,
    @Default(0) int order,
  }) = _TabModel;

  factory TabModel.fromJson(Map<String, Object?> json) =>
      _$TabModelFromJson(json);
}
