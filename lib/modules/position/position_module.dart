import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treinamento_mvvm/modules/position/controllers/navigation_controller.dart';

class PositionModule extends StatelessWidget {
  const PositionModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationPositionController())
      ],
      child: Scaffold(
        appBar: AppBar(),
        body: Consumer<NavigationPositionController>(
          builder: (context, navigation, child) {
            return navigation.currentWidget;
          },
          child: const Text("teste child "),
        ),
      ),
    );
  }
}