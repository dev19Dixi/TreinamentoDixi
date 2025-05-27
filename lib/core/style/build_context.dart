import 'package:flutter/material.dart';

import 'colors/theme_colors.dart';
import 'text/app_text_style.dart';

extension BuildContextExtensions on BuildContext {
  AppTextStyles get styles => AppTextStyles(this);

  ThemeColor get colors => ThemeColor(this);
}
