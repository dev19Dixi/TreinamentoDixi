import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treinamento_mvvm/core/style/build_context.dart';
import 'package:treinamento_mvvm/core/utils/widgets/hoverable_mixin.dart';
import 'package:treinamento_mvvm/core/utils/widgets/sized_box_extension.dart';

import '../../utils/app_dimensions.dart';
import '../controllers/menu_title_controller.dart';

class MenuTitleWidget extends StatefulWidget {
  const MenuTitleWidget({super.key});

  @override
  State<MenuTitleWidget> createState() => _MenuTitleWidgetState();
}

class _MenuTitleWidgetState extends State<MenuTitleWidget> with HoverableMixin {
  @override
  Widget build(BuildContext context) {
    Color targetIconColor = isHovered ? context.colors.onPrimaryColor : context.colors.primaryColor;

    return GestureDetector(
      onTap: () => context.read<MenuTitleController>().openSubMenu(),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => handleHover(true),
        onExit: (_) => handleHover(false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          color: isHovered ? context.colors.primaryColor : context.colors.onPrimaryColor,
          child: Row(
            children: [
              20.sizeW,
              TweenAnimationBuilder<Color?>(
                tween: ColorTween(begin: targetIconColor, end: targetIconColor),
                duration: const Duration(milliseconds: 100),
                builder: (context, color, child) {
                  return Icon(
                    Icons.library_books_outlined,
                    color: color,
                  );
                },
              ),
              20.sizeW,
              AnimatedDefaultTextStyle(
                style: isHovered ? context.styles.lightText : context.styles.blackBoldText,
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
                child: Container(
                  padding: AppDimensions.symetric,
                  child: const Text("CADASTRO"),
                ),
              ),
              const Spacer(),
              AnimatedRotation(
                turns: context.watch<MenuTitleController>().isOpen ? 0.5 : 0.0,
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeInOut,
                child: Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: isHovered ? context.colors.onPrimaryColor : context.colors.onSurfaceVariant,
                ),
              ),
              20.sizeW,
            ],
          ),
        ),
      ),
    );
  }
}
