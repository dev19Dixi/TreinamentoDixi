import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treinamento_mvvm/modules/position/controllers/navigation_controller.dart';

import '../../core/navigation/controllers/routes_provider.dart';

class HomeModule extends StatelessWidget {
  const HomeModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationPositionController()),
      ],
      child: Scaffold(
        body: TextButton(
          onPressed: () => RoutesProvider().navigateTo('/policy'),
          child: Consumer<NavigationPositionController>(builder: (context, provider, child) {
            return Navigator(
              key: provider.positionNavigatorKey,
              initialRoute: '/',
              onGenerateRoute: (RouteSettings settings) {
                return provider.provideRoutes(provider.routeName);
              },
            );
          }),
        ),
      ),
    );
  }
}
