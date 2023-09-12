import 'package:antidrugs/core/routes/router.dart';
import 'package:antidrugs/core/theme/main_theme.dart';
import 'package:flutter/material.dart';

class AntidrugsApp extends StatelessWidget {
  const AntidrugsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(scrollBehavior: const ScrollBehavior().copyWith(scrollbars: false),
      routerConfig: router,
      theme: mainTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
