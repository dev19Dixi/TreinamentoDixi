import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treinamento_mvvm/modules/position/presenter/controller/get_position_provider.dart';

import 'core/app_color.dart';
import 'modules/position/data/services/position_api_service.dart';
import 'modules/position/presenter/controller/get_list_position_provider.dart';
import 'modules/position/presenter/listbody/position_initial_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<GetListPositionProvider>.value(
        value: GetListPositionProvider(PositionApiService()),
      ),
      ChangeNotifierProvider<GetPositionProvider>.value(
        value: GetPositionProvider(PositionApiService()),
      ),
    ],
    child: const MyApp(),
  ));
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
