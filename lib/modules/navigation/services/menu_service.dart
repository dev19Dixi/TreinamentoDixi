import 'package:flutter/material.dart';
import 'package:treinamento_mvvm/modules/navigation/models/menu_model.dart';

import '../../../core/mocks/menu_mock.dart';
class MenuService extends ChangeNotifier{

  Future<List<MenuModel>> getListMenuService() async {
    await Future.delayed(const Duration(seconds: 1));
    return menuMock;
  }
}