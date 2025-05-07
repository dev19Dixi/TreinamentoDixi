import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/navigation_controller.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("detail - politica - Page"),
        TextButton(
            onPressed: () {
              context.read<NavigationPolicyController>().goToInitialPage();
            },
            child: const Center(child: Text("initial page - poltiica"))),
      ],
    );
  }
}
