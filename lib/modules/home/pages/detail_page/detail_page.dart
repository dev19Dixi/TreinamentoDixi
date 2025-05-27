import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treinamento_mvvm/core/style/build_context.dart';

import '../../controllers/navigation_home_controller.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Detail Page in Home Module", style: context.styles.primaryText),
          TextButton(
              onPressed: () {
                context.read<NavigationHomeController>().changeRoute('/');
              },
              child: Column(
                children: [
                  Text("Return to Inital Page in Home Module", style: context.styles.primaryBoldText),
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
