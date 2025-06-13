import 'package:flutter/material.dart';

import '../../../modules/error/error_module.dart';
import '../../../modules/home/home_module.dart';
import '../../../modules/policy/policy_module.dart';
import '../../../modules/position/position_module.dart';

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
    switch (settings.name) {
      case "/":
        return PageRouteBuilder(
          transitionDuration: Duration.zero,
          pageBuilder: (_, __, ___) => const HomeModule(),
        );
      case "/policy":
        return PageRouteBuilder(
          transitionDuration: Duration.zero,
          pageBuilder: (_, __, ___) => const PolicyModule(),
        );
      case "/position":
        return PageRouteBuilder(
          transitionDuration: Duration.zero,
          pageBuilder: (_, __, ___) => const PositionModule(),
        );
      default:
        return _errorRoute();
    }
  }

  Route<dynamic> _errorRoute() {
    return PageRouteBuilder(
      transitionDuration: Duration.zero,
      pageBuilder: (_, __, ___) => const ErrorModule(),
    );
  }
}
