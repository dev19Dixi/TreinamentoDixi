import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/routes_provider.dart';

// ignore: must_be_immutable
class LeftBarNavigator extends StatelessWidget {
  const LeftBarNavigator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int indexRoute = context.select<RoutesProvider, int>((routesProvider)=> routesProvider.indexRoute);
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: indexRoute,
            onDestinationSelected: (int index) {
              RoutesProvider().provideRoutesFromIndex(index);
            },
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                selectedIcon: Icon(Icons.home_filled),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person),
                selectedIcon: Icon(Icons.person_outline),
                label: Text('policy'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                selectedIcon: Icon(Icons.settings_outlined),
                label: Text('position'),
              ),
            ],
          ),

          /// Page Content
          Expanded(
            child: Stack(
              children: [
                Navigator(
                  key: RoutesProvider().navigatorKey,
                  initialRoute: '/',
                  onGenerateRoute: (RouteSettings settings) {
                    return RoutesProvider().provideRoutes(settings);
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
