import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treinamento_mvvm/modules/position/pages/initial_page/initial_page_controller.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var controller = context.watch<InitialPageController>();
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text("Component testável"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(value: controller.hasChanged, onChanged: (v) => controller.hasChanged = v!),
            const SizedBox(height: 20),
            Text("Teste Component: ${controller.hasChanged ? 'Valor alterado' : 'Valor Não Alterado'}"),
          ],
        ),
      ],
    );
  }
}
