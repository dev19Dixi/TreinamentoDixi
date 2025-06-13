import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treinamento_mvvm/core/navigation/models/submenu_model.dart';
import 'package:treinamento_mvvm/core/style/build_context.dart';
import 'package:treinamento_mvvm/core/utils/widgets/hoverable_mixin.dart';
import 'package:treinamento_mvvm/core/utils/widgets/sized_box_extension.dart';

import '../../../utils/app_dimensions.dart';
import '../../controllers/routes_provider.dart';

class SubMenuWidget extends StatefulWidget {
  const SubMenuWidget({super.key, required this.subMenuModel});
  final SubMenuModel subMenuModel;

  @override
  State<SubMenuWidget> createState() => _SubMenuWidgetState();
}

class _SubMenuWidgetState extends State<SubMenuWidget> with HoverableMixin {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    isSelected = _checkSameRoute();
    return GestureDetector(
      onTap: () => RoutesProvider().navigateTo(widget.subMenuModel.route),
      child: Row(
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
                AnimatedOpacity(
                  opacity: (isHovered || isSelected) ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 100),
                  child: Container(
                    width: 4.5,
                    height: 22,
                    color: _getColorContainer(),
                  ),
                ),
                15.sizeW,
                AnimatedDefaultTextStyle(
                  style: _getStyleText(),
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  child: Row(
                    children: [
                      Container(
                        padding: AppDimensions.symetricS,
                        child: Row(
                          children: [
                            Text(
                              widget.subMenuModel.name,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _checkSameRoute() {
    return context.watch<RoutesProvider>().routeName == widget.subMenuModel.route;
  }

  Color _getColorContainer() {
    if (isHovered || isSelected) return context.colors.primaryColor;
    return Colors.transparent;
  }

  _getStyleText() {
    if (isHovered || isSelected) return context.styles.primaryBoldText.copyWith(fontSize: 12);
    return context.styles.defaultBoldText.copyWith(fontSize: 12);
  }
}
