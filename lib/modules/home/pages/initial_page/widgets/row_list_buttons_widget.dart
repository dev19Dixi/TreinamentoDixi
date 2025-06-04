import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treinamento_mvvm/core/style/build_context.dart';

import '../../../../../core/navigation/controllers/routes_provider.dart';
import '../../../controllers/navigation_home_controller.dart';

class RowListButtonswidgets extends StatelessWidget {
  const RowListButtonswidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        const Divider(),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
                onPressed: () {
                  context.read<NavigationHomeController>().changeRoute('/:id');
                },
                child: Text(
                  "Go to Detail Page in Home Module",
                  style: context.styles.lightText,
                )),
            FilledButton(
                onPressed: () => RoutesProvider().navigateTo('/policy'), child: Text("Go to Policy Module", style: context.styles.lightText)),
          ],
        ),
      ],
    );
  }
}

