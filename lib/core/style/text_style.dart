import 'package:flutter/material.dart';

import 'build_context.dart';

class AppTextStyles {
  final BuildContext _context;
  AppTextStyles(this._context);

  TextStyle get defaultText => TextStyleDixi.defaultText(_context);
  TextStyle get defaultBoldText => TextStyleDixi.defaultBoldText(_context);
  TextStyle get greyText => TextStyleDixi.greyText(_context);
  TextStyle get greyBoldText => TextStyleDixi.greyBoldText(_context);
  TextStyle get primaryText => TextStyleDixi.primaryText(_context);
  TextStyle get primaryBoldText => TextStyleDixi.primaryBoldText(_context);
  TextStyle get lightText => TextStyleDixi.lightText(_context);
  TextStyle get lightBoldText => TextStyleDixi.lightBoldText(_context);
  TextStyle get blackText => TextStyleDixi.blackText(_context);
  TextStyle get blackBoldText => TextStyleDixi.blackBoldText(_context);
  TextStyle get errorText => TextStyleDixi.errorText(_context);
  TextStyle get successText => TextStyleDixi.successText(_context);

  TextStyle get defaultTextLineThrough => TextStyleDixi.defaultTextLineThrough(_context);
  TextStyle get defaultTextUnderline => TextStyleDixi.defaultTextUnderline(_context);
}

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
