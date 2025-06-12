import 'package:flutter/material.dart';

class MenuTitleController extends ChangeNotifier{
  bool isOpen = false;

  openSubMenu(){
    isOpen = !isOpen;
    notifyListeners();
  }
}