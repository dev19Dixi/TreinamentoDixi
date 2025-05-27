import 'package:flutter/material.dart';

import 'text_style.dart';

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
