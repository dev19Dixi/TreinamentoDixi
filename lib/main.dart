import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/navigation/controllers/routes_provider.dart';
import 'core/navigation/navigation_module.dart';
import 'core/style/theme/theme.dart';
import 'core/style/theme/theme_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: RoutesProvider()),
        ChangeNotifierProvider<ThemeController>(create: (context) => ThemeController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: context.watch<ThemeController>().theme,
      home: NavigationModule(
        child: Navigator(
          key: RoutesProvider().navigatorKey,
          initialRoute: '/',
          onGenerateRoute: (RouteSettings settings) {
            return RoutesProvider().provideRoutes(settings);
          },
        ),
      ),
    );
  }
}
