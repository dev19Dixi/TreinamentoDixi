import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treinamento_mvvm/core/style/build_context.dart';
import 'package:treinamento_mvvm/core/utils/widgets/sized_box_extension.dart';

import '../../style/theme/theme_controller.dart';
import '../controllers/routes_provider.dart';
import 'navigation_menu_widget.dart';

class MenuLeftWidget extends StatelessWidget {
  const MenuLeftWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    int indexRoute = context.select<RoutesProvider, int>((routesProvider) => routesProvider.indexRoute);
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 280,
            decoration: BoxDecoration(
              color: context.colors.surfaceColor,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(4, 0), // Right-only shadow
                  blurRadius: 8,
                  spreadRadius: 0,
                  color: Colors.black.withOpacity(0.06), // Subtle but visible
                ),
              ],
            ),
            child: Column(
              children: [
                10.sizeH,
                const ImageDixiWidget(),
                10.sizeH,
                const TextFieldSearchMenuWidget(),
                30.sizeH,
                const ListMenuNavigationWidget(),
                const Spacer(),
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
            itemCount: 3,
            itemBuilder: (context, index) {
              return const NavigationMenuWidget();
            }),
        Divider(
          height: 1,
          color: context.colors.surfaceVariant,
        ),
      ],
    );
  }
}
