import 'package:json_annotation/json_annotation.dart';
import 'package:nes_ui/nes_ui.dart';

enum TabIconEnum {
  @JsonValue('play')
  play,
  @JsonValue('pause')
  pause,
  @JsonValue('check')
  check,
  @JsonValue('saveFile')
  saveFile,
  @JsonValue('textFile')
  textFile,
  @JsonValue('chest')
  chest;

  static const defaultTabIcon = TabIconEnum.saveFile;

  NesIconData get iconData {
    switch (this) {
      case TabIconEnum.play:
        return NesIcons.play;
      case TabIconEnum.pause:
        return NesIcons.pause;
      case TabIconEnum.saveFile:
        return NesIcons.saveFile;
      case TabIconEnum.textFile:
        return NesIcons.textFile;
      case TabIconEnum.check:
        return NesIcons.check;
      case TabIconEnum.chest:
        return NesIcons.chest;
    }
  }
}
