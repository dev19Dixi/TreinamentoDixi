
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/style/theme/theme_controller.dart';

class SwitchThemeWidget extends StatelessWidget {
  const SwitchThemeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(builder: (context, controller, child) {
      return Switch(
        value: controller.theme == ThemeMode.light,
        onChanged: (value) => controller.toogle(),
      );
    });
  }
}

