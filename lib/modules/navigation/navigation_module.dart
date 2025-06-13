import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/controllers/get_list_menu_provider.dart';
import 'pages/menu_left_page.dart';
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
      ],
      child: MenuLeftPage(
        child: child,
      ),
    );
  }
}
