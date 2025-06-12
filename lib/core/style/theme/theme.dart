import 'package:flutter/material.dart';

import '../colors/app_color.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.listViewBackground,
      fontFamily: 'Roboto',
      colorScheme: const ColorScheme.light(
        // PRIMARY
        primary: AppColors.primary,
        onPrimary: AppColors.white,
        primaryContainer: AppColors.primaryLight,
        onPrimaryContainer: AppColors.primaryDark,

        // SECONDARY
        secondary: AppColors.blue,
        onSecondary: AppColors.white,
        secondaryContainer: AppColors.grey1,
        onSecondaryContainer: AppColors.grey5,

        // TERTIARY (SUCCESS)
        tertiary: AppColors.greenDark,
        onTertiary: AppColors.greenText,
        tertiaryContainer: AppColors.greenBox,
        onTertiaryContainer: AppColors.greenLight1,

        // ERROR
        error: AppColors.redText,
        onError: AppColors.white,
        errorContainer: AppColors.redBox,
        onErrorContainer: AppColors.redDark,

        // NEUTRAL / BACKGROUND / SURFACE
        background: AppColors.listViewBackground,
        onBackground: AppColors.text,
        surface: AppColors.white,
        onSurface: AppColors.text,
        surfaceVariant: AppColors.grey2,
        onSurfaceVariant: AppColors.grey6,

        // OUTLINE & SHADOWS
        outline: AppColors.grey3,
        outlineVariant: AppColors.grey4,
        shadow: AppColors.black,
        scrim: AppColors.darkBackground,

        // INVERSE
        inverseSurface: AppColors.darkSurface,
        onInverseSurface: AppColors.darkText,
        inversePrimary: AppColors.primaryDark,

        // TINT
        surfaceTint: AppColors.primary,

        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: AppColors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: AppColors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary, width: 2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.menuInput,
        hintStyle: TextStyle(color: AppColors.text.withOpacity(0.6)),
        labelStyle: const TextStyle(color: AppColors.text),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.redText, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.redDark, width: 2),
        ),
      ),
      textTheme: _textTheme(color: AppColors.black, secondaryColor: AppColors.text),
      iconTheme: const IconThemeData(color: AppColors.text),
      cardTheme: CardTheme(
        color: AppColors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(8),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        titleTextStyle: const TextStyle(
          color: AppColors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        contentTextStyle: const TextStyle(color: AppColors.text, fontSize: 16),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.selected) ? AppColors.primary : AppColors.grey3),
        checkColor: MaterialStateProperty.all(AppColors.white),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.selected) ? AppColors.primary : AppColors.grey3),
        trackColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.selected) ? AppColors.primaryLight : AppColors.grey2),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.selected) ? AppColors.primary : AppColors.grey3),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.grey5,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        unselectedLabelStyle: TextStyle(fontSize: 12),
      ),
      tabBarTheme: const TabBarTheme(
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.grey5,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: AppColors.primary, width: 3),
        ),
        labelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.primary,
        inactiveTrackColor: AppColors.primaryLight,
        thumbColor: AppColors.primaryDark,
        overlayColor: AppColors.primary.withOpacity(0.2),
        valueIndicatorColor: AppColors.primary,
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: AppColors.black.withOpacity(0.8),
          borderRadius: BorderRadius.circular(4),
        ),
        textStyle: const TextStyle(color: AppColors.white, fontSize: 12),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBackground,
      fontFamily: 'Roboto',
      colorScheme: const ColorScheme.dark(
        // --------------------
        // PRIMARY
        // --------------------
        primary: AppColors.primary,
        onPrimary: AppColors.white,
        primaryContainer: AppColors.primaryDark,
        onPrimaryContainer: AppColors.white,

        // --------------------
        // SECONDARY
        // --------------------
        secondary: AppColors.blue,
        onSecondary: AppColors.white,
        secondaryContainer: AppColors.grey5,
        onSecondaryContainer: AppColors.whiteLight,

        // --------------------
        // TERTIARY (SUCCESS)
        // --------------------
        tertiary: AppColors.greenText,
        onTertiary: AppColors.greenDark,
        tertiaryContainer: AppColors.greenBox,
        onTertiaryContainer: AppColors.greenLight2,

        // --------------------
        // ERROR
        // --------------------
        error: AppColors.redDark,
        onError: AppColors.redActive,
        errorContainer: AppColors.redBox,
        onErrorContainer: AppColors.redLight2,

        // --------------------
        // BACKGROUND & SURFACE
        // --------------------
        background: AppColors.darkBackground,
        onBackground: AppColors.darkOnBackground,
        surface: AppColors.darkSurface,
        onSurface: AppColors.darkOnSurface,
        surfaceVariant: AppColors.grey3,
        onSurfaceVariant: AppColors.grey4,

        // --------------------
        // OUTLINE & SHADOWS
        // --------------------
        outline: AppColors.darkGrey,
        outlineVariant: AppColors.grey6,
        shadow: AppColors.black,
        scrim: AppColors.black,

        // --------------------
        // INVERSE COLORS
        // --------------------
        inverseSurface: AppColors.whiteLight,
        onInverseSurface: AppColors.text,
        inversePrimary: AppColors.primaryLight,

        // --------------------
        // TINT
        // --------------------
        surfaceTint: AppColors.primary,

        brightness: Brightness.dark,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkSurface, // Darker app bar background
        foregroundColor: AppColors.darkOnSurface,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: AppColors.darkOnSurface,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: AppColors.darkOnSurface),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryLight, // Lighter primary for text buttons
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryLight,
          side: const BorderSide(color: AppColors.primaryLight, width: 2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkMenuInput,
        hintStyle: TextStyle(color: AppColors.darkOnSurface.withOpacity(0.6)),
        labelStyle: const TextStyle(color: AppColors.darkOnSurface),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.redLight2, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.redLight1, width: 2),
        ),
      ),
      textTheme: _textTheme(color: AppColors.white, secondaryColor: AppColors.darkOnSurface),
      iconTheme: const IconThemeData(color: AppColors.darkOnSurface),
      cardTheme: CardTheme(
        color: AppColors.darkSurface,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(8),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: AppColors.darkSurface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        titleTextStyle: const TextStyle(
          color: AppColors.darkOnSurface,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        contentTextStyle: const TextStyle(color: AppColors.darkOnSurface, fontSize: 16),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.selected) ? AppColors.primary : AppColors.darkGrey),
        checkColor: MaterialStateProperty.all(AppColors.white),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.selected) ? AppColors.primary : AppColors.darkGrey),
        trackColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.selected) ? AppColors.primaryDark : AppColors.grey5),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.selected) ? AppColors.primary : AppColors.darkGrey),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkSurface,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.grey5,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        unselectedLabelStyle: TextStyle(fontSize: 12),
      ),
      tabBarTheme: const TabBarTheme(
        labelColor: AppColors.primaryLight, // Lighter primary for selected tab label
        unselectedLabelColor: AppColors.grey5,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: AppColors.primaryLight, width: 3),
        ),
        labelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.primaryLight,
        inactiveTrackColor: AppColors.primaryDark,
        thumbColor: AppColors.primary,
        overlayColor: AppColors.primary.withOpacity(0.2),
        valueIndicatorColor: AppColors.primaryLight,
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.8), // Lighter tooltip for dark mode
          borderRadius: BorderRadius.circular(4),
        ),
        textStyle: const TextStyle(color: AppColors.black, fontSize: 12), // Darker text on lighter tooltip
      ),
    );
  }

  /// Shared text theme used by both light and dark themes
  static TextTheme _textTheme({required Color color, required Color secondaryColor}) {
    return TextTheme(
      displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.w400, color: color),
      displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.w400, color: color),
      displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.w400, color: color),
      headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, color: color),
      headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w400, color: color),
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: color),
      titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: color),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: color),
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: color),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: secondaryColor),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: secondaryColor),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: secondaryColor),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: secondaryColor),
      labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: secondaryColor),
      labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: secondaryColor),
    );
  }
}
