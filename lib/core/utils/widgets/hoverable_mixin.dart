import 'package:flutter/material.dart';

mixin HoverableMixin<T extends StatefulWidget> on State<T> {
  bool _isHovered = false;

  void handleHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  bool get isHovered => _isHovered;
}