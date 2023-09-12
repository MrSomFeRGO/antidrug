import 'package:antidrugs/core/AntidrugsApp.dart';
import 'package:flutter/material.dart';
import 'package:antidrugs/core/di_container.dart' as di;

void main() async{
  await di.init();

  runApp(const AntidrugsApp());
}