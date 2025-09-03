import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../dropdown_controller.dart';
import '../hoverable_mixin.dart';
import '../text_styles.dart';

class ListItemsDropdownWidget<T> extends StatefulWidget {
  const ListItemsDropdownWidget({super.key, required this.onTapItem, required this.controller, required this.scrollController});

  final Function(T item) onTapItem;
  final DropdownController<T> controller;
  final ScrollController scrollController;

  @override
  State<ListItemsDropdownWidget<T>> createState() => _ListItemsDropdownWidgetState<T>();
}

class _ListItemsDropdownWidgetState<T> extends State<ListItemsDropdownWidget<T>> {
  @override
  Widget build(BuildContext context) {
    var controller = widget.controller;
    bool isUsingFormatter = controller.formatter != null;

    return Scrollbar(
      thumbVisibility: true,
      controller: widget.scrollController,
      child: ListView.builder(
        controller: widget.scrollController,
        itemCount: controller.items.length,
        itemBuilder: (_, index) {
          final item = controller.items[index];
          return BtnItemPrimaryWidget(
            text: isUsingFormatter ? controller.formatValue(item) : item.toString(),
            onTap: () => widget.onTapItem(item),
          );
        },
      ),
    );
  }
}

class BtnItemPrimaryWidget extends StatefulWidget {
  const BtnItemPrimaryWidget({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  State<BtnItemPrimaryWidget> createState() => _BtnItemPrimaryWidgetState();
}

class _BtnItemPrimaryWidgetState extends State<BtnItemPrimaryWidget> with HoverableMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => handleHover(true),
        onExit: (_) => handleHover(false),
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          height: 40,
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: isHovered ? ColorsApp.primary : ColorsApp.white,
          ),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 150),
            style: isHovered ? Style.lightText : Style.blackText,
            child: Text(
              widget.text,
            ),
          ),
        ),
      ),
    );
  }
}
