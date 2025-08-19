import 'package:flutter/material.dart';

import 'widgets/button_with_controller_widget.dart';

class InitialPageController extends ChangeNotifier {

   InitialPageController() {
    btnController.addListener(notifyListeners);
  }
  final BtnController btnController = BtnController();

  bool _hasChanged = false;

  bool get hasChanged => _hasChanged;

  set hasChanged(bool value) {
    if(value == _hasChanged) return;
    _hasChanged = value;
    notifyListeners();
  }
}
