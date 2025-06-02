import 'package:flutter/material.dart';

class AppDimensions {
  // Padding
  static const double paddingXS = 4.0;
  static const double paddingS = 8.0;
  static const double padding = 16.0;
  static const double paddingL = 24.0;
  static const double paddingXL = 32.0;

  // Margin
  static const double marginXS = 4.0;
  static const double marginS = 8.0;
  static const double margin = 16.0;
  static const double marginL = 24.0;
  static const double marginXL = 32.0;

  // Border Radius
  static const double radiusXS = 4.0;
  static const double radiusS = 8.0;
  static const double radius = 12.0;
  static const double radiusL = 16.0;
  static const double radiusXL = 24.0;
  static const double radiusXXL = 32.0;
  static const BorderRadius borderRadius = BorderRadius.all(Radius.circular(radius));
  static const BorderRadius borderRadiusRounded = BorderRadius.all(Radius.circular(100));

  // Button Sizes
  static const double buttonHeight = 30.0;
  static const double buttonWidth = 120.0;

  // Icon Sizes
  static const double iconXS = 16.0;
  static const double iconS = 20.0;
  static const double iconM = 24.0;
  static const double iconL = 32.0;

  // Elevation
  static const double elevationLow = 2.0;
  static const double elevation = 4.0;
  static const double elevationHigh = 8.0;

  // Divider thickness
  static const double divider = 1.0;
  static const double dividerThick = 2.0;

  // Avatar
  static const double avatarSmall = 24.0;
  static const double avatarMedium = 40.0;
  static const double avatarLarge = 56.0;

  // Spacing Helpers
  static const SizedBox hSpaceS = SizedBox(width: paddingS);
  static const SizedBox hSpace = SizedBox(width: padding);
  static const SizedBox vSpaceS = SizedBox(height: paddingS);
  static const SizedBox vSpace = SizedBox(height: padding);
}
