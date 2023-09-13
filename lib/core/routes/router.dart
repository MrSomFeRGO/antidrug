import 'package:antidrugs/core/utils/constants.dart';
import 'package:antidrugs/features/auth/view/login_page.dart';
import 'package:antidrugs/features/feed/view/feed_page.dart';
import 'package:antidrugs/features/motivation/view/motivation_page.dart';
import 'package:antidrugs/features/navigation/bloc/navigation_bloc.dart';
import 'package:antidrugs/features/navigation/view/navigation_page.dart';
import 'package:antidrugs/features/report_page/view/report_page.dart';
import 'package:antidrugs/features/reports_list/dto/donosObj.dart';
import 'package:antidrugs/features/reports_list/view/reports_list_page.dart';
import 'package:antidrugs/repository/local/abstract_local_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
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
          builder: (context, state) {
            final role =
                GetIt.I<AbstractLocalRepository>().getStringValue('userRole');
            if ((role == 'user') | (role == 'guest')) {
              return const ReportPage();
            } else {
              return const ReportsListPage();
            }
          },
          routes: [
            GoRoute(
                name: 'singleDonos',
                path: Routes.denunciationSingleSubRoute,
                builder: (context, state) {
                  DonosObj donos = state.extra as DonosObj;
                  return LoginPage();
                }),
          ],
        ),
      ],
    ),
  ],
);
