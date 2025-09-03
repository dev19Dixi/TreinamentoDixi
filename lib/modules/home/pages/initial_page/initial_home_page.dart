import 'package:flutter/material.dart';
import 'package:treinamento_mvvm/core/style/build_context.dart';

import '../../../../core/style/components/dropdown_widget/dropdown_controller.dart';
import '../../../../core/style/components/dropdown_widget/dropdown_widget.dart';
import 'widgets/home_information_widget.dart';
import 'widgets/list_buttons_widget.dart';
import 'widgets/list_text_widget.dart';
import 'widgets/row_list_buttons_widget.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    var listData = ["Teste 1", "Teste 2", "Teste 11", "A", 'B', 'B', 'C'];
    var data = "Teste 11";
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            SizedBox(
              width: 300,
              child: DropdownWidget(
                controller: DropdownController<String>(
                  fetchInitialData: () async => listData,
                  value: data,
                  fetchNewPage: (page) async {
                    await Future.delayed(const Duration(seconds: 1));
                    return [
                      "Teste Add",
                    ];
                  },
                  onSelected: (value) {
                    print(value);
                  },
                  isFilerLocal: true,
                  // formatter: (value) => "Formatador: $value",
                ),
              ),
            ),
            const SizedBox(height: 15),
            const HomeInformationWidget(),
            const ListTextWidget(),
            const SizedBox(height: 8),
            const ListButtonsIwdget(),
            const SizedBox(height: 8),
            const RowListContainersWidget(),
            const RowListButtonswidgets(),
            const SizedBox(height: 15),
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
