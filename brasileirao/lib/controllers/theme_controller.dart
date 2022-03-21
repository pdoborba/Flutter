import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class ThemeController extends GetxController {
  var isDark = false.obs;

  Map<String, ThemeMode> themeModes = {
    'light': ThemeMode.light,
    'dark': ThemeMode.dark,
  };

  static ThemeController get to => Get.find();

  loadThemeMode() async {
    Directory dir = await getApplicationDocumentsDirectory();
    var box = await Hive.openBox('preferencies', path: dir.path);
    String themeText = box.get('theme') ?? 'light';
    isDark.value = themeText == 'dark' ? true : false;
    setMode(themeText);
  }

  Future setMode(String themeText) async {
    ThemeMode? themeMode = themeModes[themeText];
    Get.changeThemeMode(themeMode!);
    var box = await Hive.openBox('preferencies');
    await box.put('theme', themeText);
  }

  changeTheme() {
    setMode(isDark.value ? 'light' : 'dark');
    isDark.value = !isDark.value;
  }
}
