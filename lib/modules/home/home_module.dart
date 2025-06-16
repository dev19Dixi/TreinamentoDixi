import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_bar/controllers/app_bar_custom_mixin.dart';
import '../app_bar/models/app_bar_model.dart';
import '../app_bar/models/i_home_module.dart';
import 'controllers/navigation_home_controller.dart';

class HomeModule extends StatefulWidget implements IHomeModule {
  final NavigationHomeController? controller;

  const HomeModule({super.key, this.controller});

  @override
  State<HomeModule> createState() => _HomeModuleState();

  @override
  AppBarModel get appBarModel => AppBarModel(title: 'Home', listActions: [const Text("Sem ações por aqui")]);
}

class _HomeModuleState extends State<HomeModule> with AppBarCustomMixin {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => widget.controller ?? NavigationHomeController()),
      ],
      child: Consumer<NavigationHomeController>(builder: (context, provider, child) {
        return Navigator(
          key: provider.homeNavigatorKey,
          initialRoute: '/',
          onGenerateRoute: (RouteSettings settings) {
            return provider.provideRoutes(provider.routeName);
          },
        );
      }),
    );
  }
}
