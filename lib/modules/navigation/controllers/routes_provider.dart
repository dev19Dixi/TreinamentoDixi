import 'package:flutter/material.dart';

import '../../app_bar/models/i_home_module.dart';
import '../../error/error_module.dart';
import '../../home/home_module.dart';
import '../../policy/policy_module.dart';
import '../../position/position_module.dart';

class RoutesProvider extends ChangeNotifier {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  RoutesProvider._internal();
  static final RoutesProvider _routesProvider = RoutesProvider._internal();

  factory RoutesProvider() {
    return _routesProvider;
  }

  String routeName = '/';

  Future<void> navigateTo(String routeName) async {
    this.routeName = routeName;
    navigatorKey.currentState!.pushReplacementNamed(routeName);
    notifyListeners();
  }

  Route<dynamic> provideRoutes(RouteSettings settings) {
    Widget page;

    switch (settings.name) {
      case "/":
        page = const HomeModule();
        break;
      case "/policy":
        page = const PolicyModule();
        break;
      case "/position":
        page = const PositionModule();
        break;
      default:
        page = ErrorModule(
          route: settings.name ?? '/error',
        );
    }

    _checkIModule(page);

    final route = PageRouteBuilder(
      transitionDuration: Duration.zero,
      pageBuilder: (_, __, ___) => page,
    );

    return route;
  }

  _checkIModule(Widget page) {
    if (page is! IHomeModule) {
      print("Esse módulo não está sendo implementado a Appbar");
    }
  }
}
