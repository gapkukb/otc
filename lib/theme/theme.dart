library theme;

import 'package:flutter/material.dart';
import 'package:otc/globals/globals.dart';
part './light_theme.dart';
part './dark_theme.dart';

var brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;

class _Theme with ChangeNotifier {
  int _mode = globals.prefs.getInt("theme") ??
      (brightness == Brightness.light
          ? ThemeMode.light.index
          : ThemeMode.dark.index);

  _Theme() {
    _presist();
  }

  ThemeMode get mode {
    return ThemeMode.values[_mode];
  }

  // ThemeData get data {
  //   return _mode == ThemeMode.dark ? darkTheme : lightTheme;
  // }

  toggleTheme() {
    _mode = _mode == ThemeMode.light.index
        ? ThemeMode.dark.index
        : ThemeMode.light.index;

    notifyListeners();
    _presist();
  }

  _presist() {
    globals.prefs.setInt(globals.keys.theme, _mode);
  }
}

var theme = _Theme();
