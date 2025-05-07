import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/navigation/controllers/routes_provider.dart';
import 'core/navigation/navigation_widget.dart';
import 'core/style/app_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => RoutesProvider())],
      child: MaterialApp(
        title: 'Flutter Demo MVVM',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.kPrimary),
          useMaterial3: true,
        ),
        // navigatorKey: navigatorKey,
        home: const LeftBarNavigator(),
      ),
    );
  }
}
