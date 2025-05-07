import 'package:flutter/material.dart';

import '../pages/detail_page/detail_page.dart';
import '../pages/initial_page/initial_page.dart';

class NavigationPolicyController extends ChangeNotifier {
  Widget currentWidget = const InitialPage();

  goToInitialPage() {
    currentWidget = const InitialPage();
    notifyListeners();
  }

  goToDetailPage() {
    currentWidget = const DetailPage();
    notifyListeners();
  }
}
