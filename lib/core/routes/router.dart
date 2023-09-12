import 'package:antidrugs/core/utils/constants.dart';
import 'package:antidrugs/features/auth/view/login_page.dart';
import 'package:antidrugs/features/feed/view/feed_page.dart';
import 'package:antidrugs/features/motivation/view/motivation_page.dart';
import 'package:antidrugs/features/navigation/bloc/navigation_bloc.dart';
import 'package:antidrugs/features/navigation/view/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      path: Routes.loginNamedPage,
      builder: (context, state) => const LoginPage(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return BlocProvider(
          create: (context) => NavigationBloc(),
          child: NavigationPage(screen: child),
        );
      },
      routes: [
        GoRoute(
          name: 'feed',
          path: Routes.feedNamedPage,
          builder: (context, state) => const FeedPage(),
        ),
        GoRoute(
          name: 'motivation',
          path: Routes.motivationNamedPage,
          builder: (context, state) => const MotivationPage(),
        ),
        GoRoute(
          name: 'denunciation',
          path: Routes.denunciationNamedPage,
          builder: (context, state) => const LoginPage(),
        ),
      ],
    ),
  ],
);
