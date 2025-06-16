import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_bar/controllers/app_bar_custom_mixin.dart';
import '../app_bar/models/app_bar_model.dart';
import '../app_bar/models/i_home_module.dart';
import 'controllers/navigation_controller.dart';

class PolicyModule extends StatefulWidget {
  const PolicyModule({super.key});

  @override
  State<PolicyModule> createState() => _PolicyModuleState();
}

class _PolicyModuleState extends State<PolicyModule> with AppBarCustomMixin implements IHomeModule {
  @override
  AppBarModel get appBarModel => AppBarModel(title: '123', listActions: [const Text("test2")]);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NavigationPolicyController())],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
