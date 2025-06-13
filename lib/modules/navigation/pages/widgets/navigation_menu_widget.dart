import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treinamento_mvvm/core/utils/widgets/hoverable_mixin.dart';

import '../controllers/menu_title_controller.dart';
import '../../models/menu_model.dart';
import 'menu_title_widget.dart';
import 'sub_menu_widget.dart';

class MenuNavigationWidget extends StatefulWidget {
  const MenuNavigationWidget({super.key, required this.menuModel});

  final MenuModel menuModel;

  @override
  State<MenuNavigationWidget> createState() => _MenuNavigationWidgetState();
}

class _MenuNavigationWidgetState extends State<MenuNavigationWidget> with HoverableMixin {
  late MenuTitleController menuTitleController;
  @override
  void initState() {
    menuTitleController = MenuTitleController(widget.menuModel);
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
                            itemCount: menuTitleController.menuModel.listSubMenu.length,
                            itemBuilder: (context, index) {
                              return SubMenuWidget(
                                subMenuModel: menuTitleController.menuModel.listSubMenu[index],
                              );
                            })
                        : const SizedBox())
              ],
            );
          });
        });
  }
}
