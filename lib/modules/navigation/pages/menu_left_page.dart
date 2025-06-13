// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:treinamento_mvvm/core/style/build_context.dart';
import 'package:treinamento_mvvm/core/utils/widgets/sized_box_extension.dart';

import 'widgets/image_dixi_widget.dart';
import 'widgets/list_menu_navigation_widget.dart';
import 'widgets/switch_theme_widget.dart';
import 'widgets/text_field_search_cenu_widget.dart';

class MenuLeftPage extends StatelessWidget {
  const MenuLeftPage({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 280,
            decoration: BoxDecoration(
              color: context.colors.surfaceColor,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(4, 0),
                  blurRadius: 8,
                  spreadRadius: 0,
                  color: Colors.black.withOpacity(0.06),
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        10.sizeH,
                        const ImageDixiWidget(),
                        10.sizeH,
                        const TextFieldSearchMenuWidget(),
                        30.sizeH,
                        const ListMenuNavigationWidget(),
                      ],
                    ),
                  ),
                ),
                const SwitchThemeWidget(),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                child,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
