import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_bar_model.dart';
import '../models/i_home_module.dart';
import '../pages/controllers/appbar_custom_controller.dart';



mixin AppBarCustomMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();

    if (widget is IHomeModule) {
      final controller = context.read<AppBarCustomController>();

      WidgetsBinding.instance.addPostFrameCallback((_) {
        final module = widget as IHomeModule;
        controller.update(module.appBarModel.title, module.appBarModel.listActions);
      });
    }
    if (widget is! IHomeModule) print("Foi implementado o Mixin, mas esse Widget chamado: ${widget.toString()} não é um IModule!");
  }
}
