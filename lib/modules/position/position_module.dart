import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treinamento_mvvm/modules/position/controllers/navigation_controller.dart';

import 'pages/initial_page/initial_page_controller.dart';
import 'pages/initial_page/widgets/button_widget.dart';

class PositionModule extends StatelessWidget {
  const PositionModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavigationPositionController()),
        ChangeNotifierProvider(create: (context) => InitialPageController()),
      ],
      builder: (context, child) => const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Position module opened :)"),
            ButtonWidget()
          ],
        ),
      ),
    );
  }
}

