import 'package:flutter/material.dart';
import 'package:nes_kanban_app/features/tab/data/models/tab_model.dart';
import 'package:nes_ui/nes_ui.dart';

class HomeTab extends Tab {
  final TabModel model;
  String get id => model.id;

  HomeTab(this.model, {super.key})
      : super(
          text: model.title,
          icon: NesIcon(iconData: model.icon.iconData),
        );
}
