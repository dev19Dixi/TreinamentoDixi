import 'package:flutter/material.dart';
import 'package:treinamento_mvvm/core/style/build_context.dart';

class RowListContainersWidget extends StatelessWidget {
  const RowListContainersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: context.colors.errorColor,
          width: 150,
          height: 150,
          child: Center(
              child: Text(
            "Container Error",
            style: context.styles.lightText,
          )),
        ),
        const SizedBox(width: 15),
        Container(
          color: context.colors.primaryColor,
          width: 150,
          height: 150,
          child: Center(
              child: Text(
            "Container Primary",
            style: context.styles.lightText,
          )),
        ),
        const SizedBox(width: 15),
        Container(
          color: context.colors.inversePrimary,
          width: 150,
          height: 150,
          child: Center(
              child: Text(
            "Container Inverse Primary",
            style: context.styles.blackText,
            textAlign: TextAlign.center,
          )),
        ),
        const SizedBox(width: 15),
        Container(
          color: context.colors.successColor,
          width: 150,
          height: 150,
          child: Center(
              child: Text(
            "Container Success",
            style: context.styles.lightText,
          )),
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}
