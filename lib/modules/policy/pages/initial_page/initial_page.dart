import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treinamento_mvvm/modules/policy/controllers/navigation_controller.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("initial - polituca Page"),
        TextButton(
            onPressed: () {
              context.read<NavigationPolicyController>().goToDetailPage();
            },
            child: const Column(
              children: [
                Text("Go to detail polituca page"),
              ],
            )),
        const SizedBox(height: 15),
      ],
    );
  }
}
