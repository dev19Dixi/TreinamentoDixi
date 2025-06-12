import 'package:flutter/material.dart';

class ThemeColor {
  final BuildContext _context;
  ThemeColor(this._context);

  ColorScheme get _colorScheme => Theme.of(_context).colorScheme;

  // *** This Doc Shows (COLOR IN LIGHT THEME) from AppColor(app_color.dart) ***

  // --------------------
  // PRIMARY
  // --------------------

  /// Primary -> #49A8DB (AppColors.primary)
  Color get primaryColor => _colorScheme.primary;

  /// OnPrimary -> #FFFFFF (AppColors.white)
  Color get onPrimaryColor => _colorScheme.onPrimary;

  /// PrimaryContainer -> #A3D3EE (AppColors.primaryLight)
  Color get primaryLight => _colorScheme.primaryContainer;

  /// OnPrimaryContainer -> #36799D (AppColors.primaryDark)
  Color get primaryDark => _colorScheme.onPrimaryContainer;

  // --------------------
  // SECONDARY
  // --------------------

  /// Secondary -> #005C99 (AppColors.blue)
  Color get secondaryColor => _colorScheme.secondary;

  /// OnSecondary -> #FFFFFF (AppColors.white)
  Color get onSecondaryColor => _colorScheme.onSecondary;

  /// SecondaryContainer -> #F5F5F5 (AppColors.grey1)
  Color get secondaryLight => _colorScheme.secondaryContainer;

  /// OnSecondaryContainer -> #BDBDBD (AppColors.grey5)
  Color get onSecondaryLight => _colorScheme.onSecondaryContainer;

  // --------------------
  // TERTIARY (SUCCESS)
  // --------------------

  /// Tertiary -> #1B5E20 (AppColors.greenDark)
  Color get successColor => _colorScheme.tertiary;

  /// OnTertiary -> #2E7D32 (AppColors.greenText)
  Color get onSuccessColor => _colorScheme.onTertiary;

  /// TertiaryContainer -> #C8E6C9 (AppColors.greenBox)
  Color get successContainer => _colorScheme.tertiaryContainer;

  /// OnTertiaryContainer -> #81C784 (AppColors.greenLight1)
  Color get onSuccessContainer => _colorScheme.onTertiaryContainer;

  // --------------------
  // ERROR
  // --------------------

  /// Error -> #EF5350 (AppColors.redText)
  Color get errorColor => _colorScheme.error;

  /// OnError -> #FFFFFF (AppColors.white)
  Color get onErrorColor => _colorScheme.onError;

  /// ErrorContainer -> #FFCDD2 (AppColors.redBox)
  Color get errorContainer => _colorScheme.errorContainer;

  /// OnErrorContainer -> #B71C1C (AppColors.redDark)
  Color get onErrorContainer => _colorScheme.onErrorContainer;

  // --------------------
  // BACKGROUND & SURFACE
  // --------------------

  /// Background -> #FFFFFF (AppColors.listViewBackground)
  Color get backgroundColor => _colorScheme.background;

  /// OnBackground -> #000000 (AppColors.text)
  Color get onBackgroundColor => _colorScheme.onBackground;

  /// Surface -> #FFFFFF (AppColors.white)
  Color get surfaceColor => _colorScheme.surface;

  /// OnSurface -> #000000 (AppColors.text)
  Color get onSurfaceColor => _colorScheme.onSurface;

  /// SurfaceVariant -> #EBEDEE (AppColors.grey2)
  Color get surfaceVariant => _colorScheme.surfaceVariant;

  /// OnSurfaceVariant -> #616161 (AppColors.grey6)
  Color get onSurfaceVariant => _colorScheme.onSurfaceVariant;

  // --------------------
  // OUTLINE & SHADOWS
  // --------------------

  /// Outline -> #9E9E9E (AppColors.grey3)
  Color get outlineColor => _colorScheme.outline;

  /// OutlineVariant -> #E0E0E0 (AppColors.grey4)
  Color get outlineVariant => _colorScheme.outlineVariant;

  /// Shadow -> #000000 (AppColors.black)
  Color get shadowColor => _colorScheme.shadow;

  /// Scrim -> #000000 (AppColors.darkBackground)
  Color get scrimColor => _colorScheme.scrim;

  // --------------------
  // INVERSE COLORS
  // --------------------

  /// InverseSurface -> #2C2C2C (AppColors.darkSurface)
  Color get inverseSurface => _colorScheme.inverseSurface;

  /// OnInverseSurface -> #FFFFFF (AppColors.darkText)
  Color get onInverseSurface => _colorScheme.onInverseSurface;

  /// InversePrimary -> #36799D (AppColors.primaryDark)
  Color get inversePrimary => _colorScheme.inversePrimary;

  // --------------------
  // TINT
  // --------------------

  /// SurfaceTint -> #49A8DB (AppColors.primary)
  Color get surfaceTint => _colorScheme.surfaceTint;
}
