import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treinamento_mvvm/core/style/build_context.dart';

import '../../controllers/get_list_menu_provider.dart';
import 'navigation_menu_widget.dart';

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
