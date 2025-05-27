// lib/core/utils/context_extensions.dart
import 'package:flutter/material.dart';

import 'text_style.dart';

class ThemeColor {
  final BuildContext _context;
  ThemeColor(this._context);

  ColorScheme get _colorScheme => Theme.of(_context).colorScheme;

  // Primary and Secondary
  Color get primaryColor => _colorScheme.primary;
  Color get onPrimaryColor => _colorScheme.onPrimary;
  Color get primaryLight => _colorScheme.primaryContainer;
  Color get primaryDark => _colorScheme.onPrimaryContainer;

  Color get secondaryColor => _colorScheme.secondary;
  Color get onSecondaryColor => _colorScheme.onSecondary;
  Color get secondaryLight => _colorScheme.secondaryContainer;
  Color get onSecondaryLight => _colorScheme.onSecondaryContainer;

  // Tertiary (Success)
  Color get successColor => _colorScheme.tertiary;
  Color get onSuccessColor => _colorScheme.onTertiary;
  Color get successContainer => _colorScheme.tertiaryContainer;
  Color get onSuccessContainer => _colorScheme.onTertiaryContainer;

  // Error
  Color get errorColor => _colorScheme.error;
  Color get onErrorColor => _colorScheme.onError;
  Color get errorContainer => _colorScheme.errorContainer;
  Color get onErrorContainer => _colorScheme.onErrorContainer;

  // Background and Surface
  Color get backgroundColor => _colorScheme.background;
  Color get onBackgroundColor => _colorScheme.onBackground;
  Color get surfaceColor => _colorScheme.surface;
  Color get onSurfaceColor => _colorScheme.onSurface;
  Color get surfaceVariant => _colorScheme.surfaceVariant;
  Color get onSurfaceVariant => _colorScheme.onSurfaceVariant;

  // Outlines and Shadows
  Color get outlineColor => _colorScheme.outline;
  Color get outlineVariant => _colorScheme.outlineVariant;
  Color get shadowColor => _colorScheme.shadow;
  Color get scrimColor => _colorScheme.scrim;

  // Inverse
  Color get inverseSurface => _colorScheme.inverseSurface;
  Color get onInverseSurface => _colorScheme.onInverseSurface;
  Color get inversePrimary => _colorScheme.inversePrimary;

  // Tint
  Color get surfaceTint => _colorScheme.surfaceTint;
}

extension BuildContextExtensions on BuildContext {
  AppTextStyles get styles => AppTextStyles(this);

  ThemeColor get colors => ThemeColor(this);
}
