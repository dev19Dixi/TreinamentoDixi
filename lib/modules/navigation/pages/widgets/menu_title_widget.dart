import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treinamento_mvvm/core/style/build_context.dart';
import 'package:treinamento_mvvm/core/utils/controllers/icon_from_string.dart';
import 'package:treinamento_mvvm/core/utils/widgets/hoverable_mixin.dart';
import 'package:treinamento_mvvm/core/utils/widgets/sized_box_extension.dart';

import '../../../../core/utils/app_dimensions.dart';
import '../controllers/menu_title_controller.dart';

class MenuTitleWidget extends StatefulWidget {
  const MenuTitleWidget({super.key});

  @override
  State<MenuTitleWidget> createState() => _MenuTitleWidgetState();
}

class _MenuTitleWidgetState extends State<MenuTitleWidget> with HoverableMixin {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    isOpen = context.watch<MenuTitleController>().isOpen;
    var menuController = context.read<MenuTitleController>();
    return GestureDetector(
      onTap: () => menuController.openSubMenu(),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => handleHover(true),
        onExit: (_) => handleHover(false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          color: _getColorBackground(),
          child: Row(
            children: [
              20.sizeW,
              TweenAnimationBuilder<Color?>(
                tween: ColorTween(begin: _getColorIconStart(), end: _getColorIconStart()),
                duration: const Duration(milliseconds: 100),
                builder: (context, color, child) {
                  return Icon(
                    iconFromString[menuController.menuModel.icon],
                    color: color,
                  );
                },
              ),
              20.sizeW,
              AnimatedDefaultTextStyle(
                style: _getColorText(),
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
                child: Container(
                  padding: AppDimensions.symetric,
                  child: Text(menuController.menuModel.name.toUpperCase()),
                ),
              ),
              const Spacer(),
              AnimatedRotation(
                turns: context.watch<MenuTitleController>().isOpen ? 0.5 : 0.0,
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeInOut,
                child: Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: _getColorIcon(),
                ),
              ),
              20.sizeW,
            ],
          ),
        ),
      ),
    );
  }

  _getColorBackground() {
    if (isOpen || isHovered) return context.colors.primaryColor;
    return context.colors.surfaceColor;
  }

  _getColorText() {
    if (isOpen || isHovered) return context.styles.lightText;
    return context.styles.blackBoldText;
  }

  _getColorIcon() {
    if (isOpen || isHovered) return context.colors.surfaceColor;
    return context.colors.onSurfaceVariant;
  }

  _getColorIconStart() {
    if (isOpen || isHovered) return context.colors.onPrimaryColor;
    return context.colors.primaryColor;
  }
}
