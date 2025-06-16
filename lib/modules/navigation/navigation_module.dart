import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treinamento_mvvm/modules/app_bar/pages/controllers/appbar_custom_controller.dart';

import 'pages/menu_left_page/controllers/get_list_menu_provider.dart';
import 'pages/menu_left_page/menu_left_page.dart';
import 'services/menu_service.dart';

class NavigationModule extends StatelessWidget {
  const NavigationModule({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MenuService>(create: (context) => MenuService()),
        ChangeNotifierProvider<GetListMenuProvider>(create: (context) => GetListMenuProvider(context.read())..getListMenu()),
        ChangeNotifierProvider<AppBarCustomController>(create: (context) => AppBarCustomController()),
      ],
      child: MenuLeftPage(
        child: child,
      ),
    );
  }
}
