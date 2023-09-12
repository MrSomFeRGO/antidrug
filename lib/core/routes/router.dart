import 'package:antidrugs/core/utils/constants.dart';
import 'package:antidrugs/features/auth/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: Routes.loginNamedPage,
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
  ],
);
