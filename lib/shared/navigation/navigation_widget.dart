
import 'package:flutter/material.dart';
import 'package:treinamento_mvvm/modules/position/position_module.dart';

// ignore: must_be_immutable
class LeftBarNavigator extends StatefulWidget {
  const LeftBarNavigator({
    super.key,
  });

  @override
  State<LeftBarNavigator> createState() => _LeftBarNavigatorState();
}

class _LeftBarNavigatorState extends State<LeftBarNavigator> {
    int _selectedIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildOffstageNavigator(int index) {
    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (context) => _getScreenForIndex(index),
          );
        },
      ),
    );
  }

  Widget _getScreenForIndex(int index) {
    switch (index) {
      case 0:
        return const PositionModule();
      default:
        return const PositionModule();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Row(
      children: [
        /// Sidebar Navigation
        NavigationRail(
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onDestinationSelected,
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
              label: Text('Profile'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.settings),
              selectedIcon: Icon(Icons.settings_outlined),
              label: Text('Settings'),
            ),
          ],
        ),
    
        /// Page Content
        Expanded(
          child: Stack(
            children: List.generate(3, (index) => _buildOffstageNavigator(index)),
          ),
        ),
      ],
    ),
        );
  }
}
