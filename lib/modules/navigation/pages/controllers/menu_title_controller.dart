import 'package:flutter/material.dart';

import '../../models/menu_model.dart';

class MenuTitleController extends ChangeNotifier{
  MenuTitleController(this.menuModel);
  MenuModel menuModel;

  bool isOpen = false;

  openSubMenu(){
    isOpen = !isOpen;
    notifyListeners();
  }
  
}