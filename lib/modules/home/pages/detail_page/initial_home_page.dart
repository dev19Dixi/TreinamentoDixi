import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treinamento_mvvm/core/style/build_context.dart';

import '../../../position/controllers/navigation_controller.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("initial Page", style: context.styles.primaryText),
          TextButton(
              onPressed: () {
                context.read<NavigationPositionController>().changeRoute('/');
              },
              child: Column(
                children: [
                  Text("Go to detail page", style: context.styles.primaryBoldText),
                ],
              )),
          const SizedBox(height: 15),
          // TextButton(onPressed: () {}, child: const Text("Catch internet excpetion request")),
          // TextButton(onPressed: () {}, child: const Text("Catch 401 excpetion request")),
          // TextButton(onPressed: () {}, child: const Text("Catch 402 excpetion request")),
          // TextButton(onPressed: () {}, child: const Text("Catch 404 excpetion request")),
          // TextButton(onPressed: () {}, child: const Text("Catch 500 excpetion request")),
        
        ],
      ),
    );
  }
}
