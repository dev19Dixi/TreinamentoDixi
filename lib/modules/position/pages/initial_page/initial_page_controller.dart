import 'package:flutter/material.dart';

class InitialPageController extends ChangeNotifier {
  bool _hasChanged = false;

  bool get hasChanged => _hasChanged;

  set hasChanged(bool value) {
    if(value == _hasChanged) return;
    _hasChanged = value;
    notifyListeners();
  }
}
