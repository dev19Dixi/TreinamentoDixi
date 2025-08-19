
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../initial_page_controller.dart';

class ButtonWithControllerWidget extends StatelessWidget {
  const ButtonWithControllerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final btnController = context.read<InitialPageController>().btnController;
    final text = context.watch<InitialPageController>().btnController.text;

    return Column(
      children: [
        TextField(
          onChanged: (value) => btnController.text = value,
        ),
        const SizedBox(height: 15),
        Text("Button with Controller + $text"),
      ],
    );
  }
}

class BtnController extends ChangeNotifier {
  String _text = 'Primeiro texto';

  String get text => _text;

  set text(String value) {
    _text = value;
    notifyListeners();
  }
}
