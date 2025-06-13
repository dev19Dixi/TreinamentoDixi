// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treinamento_mvvm/core/style/build_context.dart';
import 'package:treinamento_mvvm/core/utils/widgets/sized_box_extension.dart';

import '../../../core/style/theme/theme_controller.dart';
import '../controllers/get_list_menu_provider.dart';
import 'widgets/navigation_menu_widget.dart';

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

class SwitchThemeWidget extends StatelessWidget {
  const SwitchThemeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(builder: (context, controller, child) {
      return Switch(
        value: controller.theme == ThemeMode.light,
        onChanged: (value) => controller.toogle(),
      );
    });
  }
}

class TextFieldSearchMenuWidget extends StatelessWidget {
  const TextFieldSearchMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text("pesqusiar textField");
  }
}

class ImageDixiWidget extends StatelessWidget {
  const ImageDixiWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text("Imagem Dixi");
  }
}

class ListMenuNavigationWidget extends StatelessWidget {
  const ListMenuNavigationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<GetListMenuProvider>(builder: (context, menuProvider, child) {
      return Column(
        children: [
          Divider(
            height: 1,
            color: context.colors.surfaceVariant,
          ),
          ListView.separated(
              separatorBuilder: (context, index) => Divider(
                    height: 1,
                    color: context.colors.surfaceVariant,
                  ),
              shrinkWrap: true,
              itemCount: menuProvider.listMenu.length,
              itemBuilder: (context, index) {
                return MenuNavigationWidget(menuModel: menuProvider.listMenu[index]);
              }),
          Divider(
            height: 1,
            color: context.colors.surfaceVariant,
          ),
        ],
      );
    });
  }
}
