import 'package:flutter/material.dart';
import 'package:sample01/src/configs/theme.dart';

const List<String> themes = <String>[
  'smart modern',
  'berry',
  'conserative',
  'default'
];

const int colorNum = 4;

class ThemeModel with ChangeNotifier {
  var _sw = 0;

  get sw => _sw;

  String getThemeName() => themes[_sw];

  changeTheme() {
    _sw++;
    if (_sw == colorNum) {
      _sw = 0;
    }
    notifyListeners();
  }

  ThemeData setMyTheme() {
    switch (_sw) {
      case 0:
        return MyTheme.smartModern();
      case 1:
        return MyTheme.berry();
      case 2:
        return MyTheme.conservative();
      default:
        return ThemeData.light();
    }
  }
}
