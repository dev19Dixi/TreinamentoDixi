import 'package:flutter/material.dart';

mixin DropdownAnimationMixin<T extends StatefulWidget> on State<T>, TickerProviderStateMixin<T> {
  late final AnimationController animationController;
  late final Animation<double> animation;

  void initDropdownAnimation({Duration duration = const Duration(milliseconds: 200), Curve curve = Curves.easeOut}) {
    animationController = AnimationController(
      vsync: this,
      duration: duration
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: curve,
    );
  }

  void disposeDropdownAnimation() {
    animationController.dispose();
  }

  void playOpenAnimation() {
    animationController.forward();
  }

  void playCloseAnimation(VoidCallback onCompleted) {
    animationController.reverse().then((_) => onCompleted());
  }
}
