import 'package:antidrugs/core/AntidrugsApp.dart';
import 'package:antidrugs/core/di_container.dart' as di;
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const AntidrugsApp());
}
