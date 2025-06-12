import 'package:flutter/material.dart';
import 'package:treinamento_mvvm/core/style/build_context.dart';
import 'package:treinamento_mvvm/core/utils/widgets/hoverable_mixin.dart';
import 'package:treinamento_mvvm/core/utils/widgets/sized_box_extension.dart';

import '../../utils/app_dimensions.dart';

class SubMenuWidget extends StatefulWidget {
  const SubMenuWidget({
    super.key,
  });

  @override
  State<SubMenuWidget> createState() => _SubMenuWidgetState();
}

class _SubMenuWidgetState extends State<SubMenuWidget> with HoverableMixin {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        20.sizeW,
        const Icon(
          Icons.library_books_outlined,
          color: Colors.transparent,
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => handleHover(true),
          onExit: (_) => handleHover(false),
          child: Row(
            children: [
              Container(width: 4.5, height: 22, color: isHovered ? context.colors.primaryColor : Colors.transparent),
              15.sizeW,
              AnimatedDefaultTextStyle(
                style: isHovered ? context.styles.primaryBoldText.copyWith(fontSize: 12) : context.styles.defaultBoldText.copyWith(fontSize: 12),
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
                child: Container(
                  padding: AppDimensions.symetricS,
                  child: const Text("CADASTRO"),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.keyboard_arrow_down_sharp,
          color: Colors.transparent,
        ),
        20.sizeW,
      ],
    );
  }
}
