
import 'package:flutter/material.dart';
class ThemeColor {
  final BuildContext _context;
  ThemeColor(this._context);

  ColorScheme get _colorScheme => Theme.of(_context).colorScheme;

  // *** This Doc Shows first (COLOR IN LIGHT THEME) or (COLOR IN DARK THEME) from AppColor(app_color.dart) file ***

  /// Primary -> #49A8DB or #36799D
  Color get primaryColor => _colorScheme.primary;

  /// OnPrimary -> #FFFFFF or #FFFFFF
  Color get onPrimaryColor => _colorScheme.onPrimary;

  /// PrimaryContainer -> #A3D3EE or #2B5A70
  Color get primaryLight => _colorScheme.primaryContainer;

  /// OnPrimaryContainer -> #36799D or #A3D3EE
  Color get primaryDark => _colorScheme.onPrimaryContainer;

  /// Secondary -> #005C99 or #7BB6DE
  Color get secondaryColor => _colorScheme.secondary;

  /// OnSecondary -> #FFFFFF or #003652
  Color get onSecondaryColor => _colorScheme.onSecondary;

  /// SecondaryContainer -> #F5F5F5 or #071E2B
  Color get secondaryLight => _colorScheme.secondaryContainer;

  /// OnSecondaryContainer -> #BDBDBD or #7BB6DE
  Color get onSecondaryLight => _colorScheme.onSecondaryContainer;

  // Tertiary (Success)
  /// Tertiary -> #1B5E20 or #81C784
  Color get successColor => _colorScheme.tertiary;

  /// OnTertiary -> #2E7D32 or #1B5E20
  Color get onSuccessColor => _colorScheme.onTertiary;

  /// TertiaryContainer -> #C8E6C9 or #005005
  Color get successContainer => _colorScheme.tertiaryContainer;

  /// OnTertiaryContainer -> #004D40 or #C8E6C9
  Color get onSuccessContainer => _colorScheme.onTertiaryContainer;

  // Error
  /// Error -> #EF5350 or #E57373
  Color get errorColor => _colorScheme.error;

  /// OnError -> #FFFFFF or #000000
  Color get onErrorColor => _colorScheme.onError;

  /// ErrorContainer -> #FFCDD2 or #B71C1C
  Color get errorContainer => _colorScheme.errorContainer;

  /// OnErrorContainer -> #B00020 or #FFCDD2
  Color get onErrorContainer => _colorScheme.onErrorContainer;

  // Background and Surface
  /// Background -> #FFFFFF or #121212
  Color get backgroundColor => _colorScheme.background;

  /// OnBackground -> #000000 or #FFFFFF
  Color get onBackgroundColor => _colorScheme.onBackground;

  /// Surface -> #FFFFFF or #1E1E1E
  Color get surfaceColor => _colorScheme.surface;

  /// OnSurface -> #000000 or #FFFFFF
  Color get onSurfaceColor => _colorScheme.onSurface;

  /// SurfaceVariant -> #F2F2F2 or #2C2C2C
  Color get surfaceVariant => _colorScheme.surfaceVariant;

  /// OnSurfaceVariant -> #616161 or #BDBDBD
  Color get onSurfaceVariant => _colorScheme.onSurfaceVariant;

  // Outlines and Shadows
  /// Outline -> #9E9E9E or #757575
  Color get outlineColor => _colorScheme.outline;

  /// OutlineVariant -> #E0E0E0 or #424242
  Color get outlineVariant => _colorScheme.outlineVariant;

  /// Shadow -> #000000 or #000000
  Color get shadowColor => _colorScheme.shadow;

  /// Scrim -> #000000 or #000000
  Color get scrimColor => _colorScheme.scrim;

  // Inverse
  /// InverseSurface -> #2C2C2C or #E0E0E0
  Color get inverseSurface => _colorScheme.inverseSurface;

  /// OnInverseSurface -> #FFFFFF or #000000
  Color get onInverseSurface => _colorScheme.onInverseSurface;

  /// InversePrimary -> #49A8DB or #36799D
  Color get inversePrimary => _colorScheme.inversePrimary;

  // Tint
  /// SurfaceTint -> #49A8DB or #36799D
  Color get surfaceTint => _colorScheme.surfaceTint;
}
