import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_bar/controllers/app_bar_custom_mixin.dart';
import '../app_bar/models/app_bar_model.dart';
import '../app_bar/models/i_home_module.dart';
import 'controllers/navigation_controller.dart';

class PolicyModule extends StatefulWidget implements IHomeModule {
  const PolicyModule({super.key});

  @override
  State<PolicyModule> createState() => _PolicyModuleState();

  @override
  AppBarModel get appBarModel => AppBarModel(
        title: 'Módulo de Política de Extras',
        listActions: [const Text("botão que quiser aqui")],
      );
}

class _PolicyModuleState extends State<PolicyModule> with AppBarCustomMixin {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationPolicyController()),
      ],
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Policy module opened :)"),
          ],
        ),
      ),
    );
  }
}
