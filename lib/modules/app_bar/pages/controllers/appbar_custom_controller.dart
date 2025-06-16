import 'package:flutter/material.dart';

class AppBarCustomController extends ChangeNotifier {
  List<Widget> listWidgetRight = [];
  String title = '';

  update(String title, List<Widget> listWidgetRight) {
    this.title = title;
    this.listWidgetRight = listWidgetRight;
    notifyListeners();
  }
}
