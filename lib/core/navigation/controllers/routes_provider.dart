import 'package:flutter/material.dart';

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

  int indexRoute = 0;

  Map<int, String> reverseMap(Map<String, int> map) {
    return map.map((k, v) => MapEntry(v, k));
  }

  Future<dynamic> navigateTo(String routeName) {
    indexRoute = routes[routeName]!;
    notifyListeners();
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  Route<dynamic> provideRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const HomeModule(),
        );
      case "/policy":
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const PolicyModule(),
        );
      case "/position":
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const PositionModule(),
        );
      default:
        return _errorRoute();
    }
  }

  void provideRoutesFromIndex(int index) {
    indexRoute = index;
    notifyListeners();
    try {
      Map<int, String> reversed = routes.map((k, v) => MapEntry(v, k));
      RoutesProvider().navigateTo(reversed[index]!);
    } catch (e) {
      RoutesProvider().navigateTo('/error');
    }
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(child: Text('ERROR')),
      );
    });
  }

  Map<String, int> get routes => {
        '/error': -1,
        '/': 0,
        '/policy': 1,
        '/position': 2,
      };
}
