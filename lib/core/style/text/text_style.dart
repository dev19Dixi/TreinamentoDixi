import 'package:flutter/material.dart';

import '../colors/theme_colors.dart';


class TextStyleDixi {
  static const String _fontFamily = 'RobotoSlab';
  static const TextStyle _baseTextStyle = TextStyle(fontFamily: _fontFamily);

  static TextStyle defaultText(BuildContext context) {
    return _baseTextStyle.copyWith(
      color: ThemeColor(context).onSurfaceColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle defaultBoldText(BuildContext context) {
    return _baseTextStyle.copyWith(
      color: ThemeColor(context).onSurfaceColor,
      fontSize: 14,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle greyText(BuildContext context) {
    return _baseTextStyle.copyWith(
      color: ThemeColor(context).outlineColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle greyBoldText(BuildContext context) {
    return _baseTextStyle.copyWith(
      color: ThemeColor(context).outlineColor,
      fontSize: 14,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle primaryText(BuildContext context) {
    return _baseTextStyle.copyWith(
      color: ThemeColor(context).primaryColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle primaryBoldText(BuildContext context) {
    return _baseTextStyle.copyWith(
      color: ThemeColor(context).primaryColor,
      fontSize: 14,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle secondaryText(BuildContext context) {
    return _baseTextStyle.copyWith(
      color: ThemeColor(context).secondaryColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle lightText(BuildContext context) {
    return _baseTextStyle.copyWith(
      color: ThemeColor(context).onPrimaryColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle lightBoldText(BuildContext context) {
    return _baseTextStyle.copyWith(
      color: ThemeColor(context).onPrimaryColor,
      fontSize: 14,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle blackText(BuildContext context) {
    return _baseTextStyle.copyWith(
      color: ThemeColor(context).shadowColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle blackBoldText(BuildContext context) {
    return _baseTextStyle.copyWith(
      color: ThemeColor(context).onBackgroundColor,
      fontSize: 14,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle errorText(BuildContext context) {
    return _baseTextStyle.copyWith(
      color: ThemeColor(context).errorColor,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle successText(BuildContext context) {
    return _baseTextStyle.copyWith(
      color: ThemeColor(context).successColor,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle successBoldText(BuildContext context) {
    return _baseTextStyle.copyWith(
      color: ThemeColor(context).successColor,
      fontSize: 12,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle warningText(BuildContext context) {
    return _baseTextStyle.copyWith(
      color: ThemeColor(context).inversePrimary,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle defaultTextLineThrough(BuildContext context) {
    return _baseTextStyle.copyWith(
      color: ThemeColor(context).onSurfaceColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.lineThrough,
    );
  }

  static TextStyle defaultTextUnderline(BuildContext context) {
    return _baseTextStyle.copyWith(
      color: ThemeColor(context).onSurfaceColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.underline,
    );
  }
}
