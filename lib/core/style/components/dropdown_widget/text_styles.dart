import 'package:flutter/material.dart';

import 'app_colors.dart';

class Style {
  static TextStyle get textStyle {
    return const TextStyle(fontFamily: 'RobotoSlab');
  }

  //DEFAULT TEXT
  static TextStyle defaultText = textStyle.copyWith(
    color: ColorsApp.text,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle defaultBoldText = textStyle.copyWith(
    color: ColorsApp.text,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  // GREY TEXT
  static TextStyle greyText = textStyle.copyWith(
    color: ColorsApp.grey4,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle greyBoldText = textStyle.copyWith(
    color: ColorsApp.grey4,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  //PRIMARY TEXT
  static TextStyle primaryText = textStyle.copyWith(
    color: ColorsApp.primary,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static TextStyle primaryBoldText = textStyle.copyWith(
    color: ColorsApp.primary,
    fontSize: 13,
    fontWeight: FontWeight.w700,
  );

  //WHITE/LIGHT TEXT
  static TextStyle lightText = textStyle.copyWith(
    color: ColorsApp.white,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle lightBoldText = textStyle.copyWith(
    color: ColorsApp.white,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  //BLACK TEXT

  static TextStyle blackText = textStyle.copyWith(
    color: ColorsApp.black,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle blackBoldText = textStyle.copyWith(
    color: ColorsApp.black,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static TextStyle errorText = textStyle.copyWith(
    color: ColorsApp.redText,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static TextStyle successText = textStyle.copyWith(
    color: ColorsApp.greenText,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  // Grey text Ep
  static TextStyle defaultTextLineThrough = textStyle.copyWith(
    color: ColorsApp.text,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.lineThrough,
  );

  static TextStyle defaultTextUnderline = textStyle.copyWith(
    color: ColorsApp.text,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
  );
}
