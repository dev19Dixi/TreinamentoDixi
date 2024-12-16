import 'package:flutter/material.dart';

import 'core/app_color.dart';
import 'modules/position/presenter/listbody/position_initial_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo MVVM',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.kPrimary),
        useMaterial3: true,
      ),
      home: const PositionInitialPage(),
    );
  }
}
