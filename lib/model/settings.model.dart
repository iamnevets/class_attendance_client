import 'package:flutter/material.dart';

class SettingItem {
  String name = '';
  String jumpTo = '';
  Icon icon;

  SettingItem({
    required this.name,
    required this.icon,
    required this.jumpTo,
  });
}
