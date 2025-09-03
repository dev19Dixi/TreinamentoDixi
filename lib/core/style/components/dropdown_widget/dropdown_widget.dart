import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'dropdown_controller.dart';
import 'hoverable_mixin.dart';
import 'text_styles.dart';
import 'widgets/animation_mixin.dart';
import 'widgets/list_item_widget.dart';
import 'widgets/textfield_seach_widget.dart';

class DropdownWidget<T> extends StatefulWidget {
  final DropdownController<T> controller;

  const DropdownWidget({
    super.key,
    required this.controller,
  });

  @override
  State<DropdownWidget<T>> createState() => DropdownStateWidget<T>();
}

class DropdownStateWidget<T> extends State<DropdownWidget<T>>
    with TickerProviderStateMixin, HoverableMixin, DropdownAnimationMixin {
  final ScrollController _scrollController = ScrollController();
  late final DropdownController<T> controller;

  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  final gllobalKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    controller = widget.controller;
    controller.addListener(_onControllerUpdated);
    _scrollController.addListener(_handleScroll);

    controller.loadInitial(controller.value);
    initDropdownAnimation();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    controller.disposeController();
    controller.removeListener(_onControllerUpdated);
    disposeDropdownAnimation();
    super.dispose();
  }

  void _onControllerUpdated() {
    if (mounted) {
      setState(() {});
    }
  }

  void _toggleDropdown() {
    if (_overlayEntry == null) {
      _showOverlay();
    } else {
      _removeOverlay();
    }
  }

  void _removeOverlay() {
    playCloseAnimation(() {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  void _handleScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100) {
      if (controller.fetchNewPage != null && controller.hasMore && !controller.isLoading) {
        controller.loadMore();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: ListenableBuilder(
        listenable: controller,
        builder: (context, child) {
          return SizedBox(
            height: controller.height,
            child: MouseRegion(
              onEnter: (_) => handleHover(true),
              onExit: (_) => handleHover(false),
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => _toggleDropdown(),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  decoration: BoxDecoration(
                    color: ColorsApp.grey2,
                    border: Border.all(
                      width: 2,
                      color: isHovered ? ColorsApp.primary : Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (controller.selected != null)
                        Text(
                          controller.formatter != null
                              ? controller.formatValue(controller.selected)
                              : controller.selected!.toString(),
                          style: Style.blackText.copyWith(fontSize: 13),
                        )
                      else if (controller.isLoading)
                        Text(
                          'Carregando...',
                          style: Style.greyText.copyWith(fontSize: 13),
                        )
                      else
                        Text(
                          (controller.hintText ?? 'Selecione uma opção'),
                          style: Style.greyText.copyWith(fontSize: 13),
                        ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: ColorsApp.black,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showOverlay() {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (_) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          offset: Offset(0.0, size.height),
          link: _layerLink,
          showWhenUnlinked: false,
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4)),
            child: SizeTransition(
              sizeFactor: animation,
              axisAlignment: 1.0,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: controller.getMaxHeight()),
                child: Column(
                  children: [
                    if (controller.fetchFilter != null || controller.isFilerLocal) TextFieldSeachWidget(controller: controller),
                    ListenableBuilder(
                      listenable: controller,
                      builder: (context, child) {
                        return Expanded(
                          child: ListItemsDropdownWidget<T>(
                            controller: controller,
                            onTapItem: (item) {
                              controller.setSelected(item);
                              controller.onSelected(item);
                              _removeOverlay();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    playOpenAnimation();
  }
  
}
