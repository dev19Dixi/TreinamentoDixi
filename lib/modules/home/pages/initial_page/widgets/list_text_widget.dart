import 'package:flutter/material.dart';
import 'package:treinamento_mvvm/core/style/build_context.dart';
class ListTextWidget extends StatelessWidget {
  const ListTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        const SizedBox(height: 8),
        Text("Text using style: defaultText", style: context.styles.defaultText),
        const SizedBox(height: 15),
        Text("Text using style: greyBoldText", style: context.styles.greyBoldText),
        const SizedBox(height: 15),
        Text("Text using style: successText", style: context.styles.successText.copyWith(fontSize: 14)),
        const SizedBox(height: 15),
        Text("Text using style: errorText", style: context.styles.errorText.copyWith(fontSize: 14)),
        const SizedBox(height: 8),
        const Divider(),
      ],
    );
  }
}
