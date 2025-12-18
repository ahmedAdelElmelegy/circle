import 'package:flutter/material.dart';

class SettingModel {
  final String title;
  final VoidCallback? onTap;
  final String icon;

  SettingModel(this.onTap, {required this.title, required this.icon});
}
