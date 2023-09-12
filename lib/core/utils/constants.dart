import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const root = '/';
  static const loginNamedPage = '/login';
  static const mapNamedPage = '/map';
  static const notificationNamedPage = '/events';
  static const profileNamedPage = '/profile';
  static const objectsNamedPage = '/objects';
  static const objectsDetailsSubRoute = 'details';
  static const objectsDetailsNamedPage =
      '$objectsNamedPage/$objectsDetailsSubRoute';
  static const objectsDetailsChartSubRoute = 'chart';
  static const objectsDetailsChartNamedPage =
      '$objectsNamedPage/$objectsDetailsSubRoute/$objectsDetailsChartSubRoute';
  static const objectsDetailsParamsSubRoute = 'params';
  static const objectsDetailsParamsNamedPage =
      '$objectsNamedPage/$objectsDetailsSubRoute/$objectsDetailsParamsSubRoute';
  static const objectsDetailsEventsSubRoute = 'events';
  static const objectsDetailsEventsNamedPage =
      '$objectsNamedPage/$objectsDetailsSubRoute/$objectsDetailsEventsSubRoute';
  static const objectsDetailsEventsDetailSubRoute = 'detail';
  static const objectsDetailsEventsDetailNamedPage =
      '$objectsNamedPage/$objectsDetailsSubRoute/$objectsDetailsEventsSubRoute/$objectsDetailsEventsDetailSubRoute';

}

class ServerConst {
  static const String apiBaseUrl = 'https://1sim.ru/api2/';
  static const String imgBaseUrl = 'https://1sim.ru';
}
