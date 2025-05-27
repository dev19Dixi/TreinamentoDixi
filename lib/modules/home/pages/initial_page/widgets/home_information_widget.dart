import 'package:flutter/material.dart';
import 'package:treinamento_mvvm/core/style/build_context.dart';

class HomeInformationWidget extends StatelessWidget {
  const HomeInformationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Home Module",
          style: context.styles.primaryBoldText.copyWith(fontSize: 30),
        ),
        Icon(
          Icons.home,
          size: 150,
          color: context.colors.primaryColor,
        ),
        const SizedBox(height: 15),
        Text(
          "This is example using new Styles: ",
          style: context.styles.primaryBoldText.copyWith(fontSize: 20),
        ),
      ],
    );
  }
}
