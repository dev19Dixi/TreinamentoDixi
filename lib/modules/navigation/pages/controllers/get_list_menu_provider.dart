import 'package:flutter/material.dart';
import 'package:treinamento_mvvm/modules/navigation/services/menu_service.dart';

import '../../models/menu_model.dart';

class GetListMenuProvider extends ChangeNotifier {
  GetListMenuProvider(this.service);
  MenuService service;

  List<MenuModel> listMenu = [];
  bool isLoading = true;
  String error = '';

  Future<void> getListMenu() async {
    isLoading = true;
    notifyListeners();
    try {
      listMenu = await service.getListMenuService();

      if (listMenu.isEmpty) {
        error = 'Ocorreu erro ao requisitar o Menu';
      }
    } catch (e) {
      error = 'Erro inesperado ocorreu';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
