import 'package:flutter/material.dart';

class NamedNavigationBarItemWidget extends BottomNavigationBarItem {
  final String initialLocation;
  @override
  final String label;

  NamedNavigationBarItemWidget(
      {required this.initialLocation,
      required Widget icon,
      required this.label})
      : super(icon: icon, label: label);
}
