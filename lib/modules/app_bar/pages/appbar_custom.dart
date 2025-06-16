import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treinamento_mvvm/core/utils/widgets/sized_box_extension.dart';
import 'package:treinamento_mvvm/modules/app_bar/pages/controllers/appbar_custom_controller.dart';

const double heightAppBar = 48.0;

class AppBarCustom extends StatelessWidget implements PreferredSize {
  const AppBarCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var appBarCustomController = context.watch<AppBarCustomController>();
    return AppBar(
      title: Text(appBarCustomController.title),
      actions: [...appBarCustomController.listWidgetRight, 20.sizeW],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(heightAppBar);
}
