
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treinamento_mvvm/modules/position/pages/initial_page/controllers/get_position_provider.dart';

import 'core/style/app_color.dart';
import 'modules/position/services/position_api_service.dart';
import 'modules/position/pages/initial_page/controllers/get_list_position_provider.dart';

void main() {
  runApp(
    MultiProvider(
    providers: [
        ChangeNotifierProvider<PositionApiService>(
        create: (context)=> PositionApiService(),
      ),
      ChangeNotifierProvider(
        create: (context)=> GetListPositionProvider(context.read<PositionApiService>()),
      ),
      ChangeNotifierProvider<GetListPositionProvider>(
        create: (context)=> GetListPositionProvider(context.read<PositionApiService>()),
      ),
      ChangeNotifierProvider<GetPositionProvider>(
        create: (context)=> GetPositionProvider(context.read<PositionApiService>()),
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
      home: Container(),
    );
  }
}
