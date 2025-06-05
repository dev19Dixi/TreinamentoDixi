import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treinamento_mvvm/modules/home/controllers/navigation_home_controller.dart';

class HomeModule extends StatelessWidget {
  final NavigationHomeController? controller;

  const HomeModule({super.key, this.controller});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => controller ?? NavigationHomeController()),
      ],
      child: Scaffold(
        body: Consumer<NavigationHomeController>(builder: (context, provider, child) {
          return Navigator(
            key: provider.homeNavigatorKey,
            initialRoute: '/',
            onGenerateRoute: (RouteSettings settings) {
              return provider.provideRoutes(provider.routeName);
            },
          );
        }),
      ),
    );
  }
}
