import 'package:flutter/material.dart';

class AppDimensions {
  // Padding or Margin
  static const double spaceXS = 5;
  static const double spaceS = 10;
  static const double space = 16.0;
  static const double spaceL = 24.0;
  static const double spaceXL = 32.0;

  // EdgeInsets
  static const EdgeInsetsGeometry symetricXS = EdgeInsets.symmetric(vertical: spaceXS);
  static const EdgeInsetsGeometry symetricS = EdgeInsets.symmetric(vertical: spaceS);
  static const EdgeInsetsGeometry symetric = EdgeInsets.symmetric(vertical: space);
  static const EdgeInsetsGeometry symetricL = EdgeInsets.symmetric(vertical: spaceL);
  static const EdgeInsetsGeometry symetricXL = EdgeInsets.symmetric(vertical: spaceXL);

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
}
