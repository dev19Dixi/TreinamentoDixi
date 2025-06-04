import 'package:flutter/material.dart';
import 'package:treinamento_mvvm/core/style/build_context.dart';

import 'widgets/home_information_widget.dart';
import 'widgets/list_buttons_widget.dart';
import 'widgets/list_text_widget.dart';
import 'widgets/row_list_buttons_widget.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            HomeInformationWidget(),
            ListTextWidget(),
            SizedBox(height: 8),
            ListButtonsIwdget(),
            SizedBox(height: 8),
            RowListContainersWidget(),
            RowListButtonswidgets(),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

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
