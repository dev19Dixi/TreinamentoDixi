import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/navigation_controller.dart';

class PolicyModule extends StatelessWidget {
  const PolicyModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NavigationPolicyController())],
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            const Text("Policy module opened :)"),
            Consumer<NavigationPolicyController>(
              builder: (context, navigation, child) {
                return navigation.currentWidget;
              },
            ),
          ],
        ),
      ),
    );
  }
}
