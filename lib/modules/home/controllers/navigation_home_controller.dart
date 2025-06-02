import 'package:flutter/material.dart';

import '../pages/detail_page/detail_page.dart';
import '../pages/initial_page/initial_home_page.dart';

class NavigationHomeController extends ChangeNotifier {
  final GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey<NavigatorState>();

  String routeName = '/';
  Route<dynamic> provideRoutes(String route) {
    switch (route) {
      case "/":
        return PageRouteBuilder(
          transitionDuration: Duration.zero,
          pageBuilder: (_, __, ___) => const InitialPage(),
        );
      case "/:id":
        return PageRouteBuilder(
          transitionDuration: Duration.zero,
          pageBuilder: (_, __, ___) => const DetailPage(),
        );

      default:
        return PageRouteBuilder(
          transitionDuration: Duration.zero,
          pageBuilder: (_, __, ___) => const Text("Sem rota"),
        );
    }
  }

  changeRoute(String name) {
    routeName = name;
    notifyListeners();
    return homeNavigatorKey.currentState!.pushReplacementNamed(routeName);
  }
}
