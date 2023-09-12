import 'package:antidrugs/core/widgets/svg_icon.dart';
import 'package:antidrugs/features/navigation/widgets/named_nav_bar_item_widget.dart';
import 'package:antidrugs/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const root = '/';
  static const loginNamedPage = '/login';
  static const feedNamedPage = '/feed';
  static const motivationNamedPage = '/motivation';
  static const denunciationNamedPage = '/denunciation';
}

final navigationTabs = [
  NamedNavigationBarItemWidget(
    initialLocation: Routes.feedNamedPage,
    icon: SvgIcon(Assets.svg.main.path),
    label: 'Профилактика',
  ),
  NamedNavigationBarItemWidget(
    initialLocation: Routes.motivationNamedPage,
    icon: SvgIcon(Assets.svg.motivation.path),
    label: 'Мотивация',
  ),
  NamedNavigationBarItemWidget(
    initialLocation: Routes.denunciationNamedPage,
    icon: SvgIcon(Assets.svg.donos.path),
    label: 'Донос',
  ),
];


class ServerConst {
  static const String apiBaseUrl = 'https://1sim.ru/api2/';
  static const String imgBaseUrl = 'https://1sim.ru';
}
