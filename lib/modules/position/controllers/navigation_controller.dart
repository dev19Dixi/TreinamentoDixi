import 'package:flutter/material.dart';
import 'package:treinamento_mvvm/modules/position/pages/initial_page/initial_page.dart';

import '../pages/detail_page/detail_page.dart';

class NavigationPositionController extends ChangeNotifier{
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