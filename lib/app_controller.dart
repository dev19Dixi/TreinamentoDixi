import 'package:flutter/material.dart';

import 'modules/auth/models/user_model.dart';

class AppController extends ChangeNotifier {
  bool hasLogged = false;

  UserModel? user;

  loginUser(UserModel user) {
    this.user = user;
    hasLogged = true;
    notifyListeners();
  }

  logoutUser() {
    user = null;
    hasLogged = false;
    notifyListeners();
  }
}
