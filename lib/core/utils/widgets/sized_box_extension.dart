import 'package:flutter/material.dart';

extension SizedBoxExtension on num {
  SizedBox get sizeH => SizedBox(height: toDouble());

  SizedBox get sizeW => SizedBox(width: toDouble());
}