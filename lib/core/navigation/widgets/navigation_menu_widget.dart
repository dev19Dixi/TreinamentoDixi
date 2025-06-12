import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treinamento_mvvm/core/utils/widgets/hoverable_mixin.dart';

import '../controllers/menu_title_controller.dart';
import 'menu_title_widget.dart';
import 'sub_menu_widget.dart';

class NavigationMenuWidget extends StatefulWidget {
  const NavigationMenuWidget({
    super.key,
  });

  @override
  State<NavigationMenuWidget> createState() => _NavigationMenuWidgetState();
}

class _NavigationMenuWidgetState extends State<NavigationMenuWidget> with HoverableMixin {
  late MenuTitleController menuTitleController;
  @override
  void initState() {
    menuTitleController = MenuTitleController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => menuTitleController,
        builder: (context, child) {
          return Consumer<MenuTitleController>(builder: (context, controller, child) {
            return Column(
              children: [
                const MenuTitleWidget(),
                AnimatedSize(
                    duration: const Duration(milliseconds: 150),
                    curve: Curves.easeInOut,
                    child: controller.isOpen
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return const SubMenuWidget();
                            })
                        : const SizedBox())
              ],
            );
          });
        });
  }
}
