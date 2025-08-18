import 'package:flutter/material.dart';
import 'package:treinamento_mvvm/modules/position/pages/initial_page/initial_page.dart';

import '../pages/detail_page/detail_page.dart';
import '../pages/initial_page/initial_page_controller.dart';

class NavigationPositionController extends ChangeNotifier {
  final GlobalKey<NavigatorState> positionNavigatorKey = GlobalKey<NavigatorState>();

  String routeName = '/';
  Route<dynamic> provideRoutes(String route) {
    switch (route) {
      case "/":
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) =>  InitialPage(controller: InitialPageController()),
        );
      case "/:id":
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const DetailPage(),
        );

      default:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const Text("Sem rota"),
        );
    }
  }

  changeRoute(String name) {
    routeName = name;
    notifyListeners();
    return positionNavigatorKey.currentState!.pushReplacementNamed(routeName);
  }
}
