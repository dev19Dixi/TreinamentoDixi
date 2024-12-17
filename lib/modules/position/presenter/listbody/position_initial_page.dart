import 'package:flutter/material.dart';
import 'package:treinamento_mvvm/core/text_style.dart';

import 'list_positions_page.dart';

class PositionInitialPage extends StatefulWidget {
  const PositionInitialPage({super.key});

  @override
  State<PositionInitialPage> createState() => _PositionInitialPageState();
}

class _PositionInitialPageState extends State<PositionInitialPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Página inicial"),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const ListPositionPage(),
                    ),
                  ),
              icon: const Icon(Icons.chevron_right))
        ],
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () => setState(() {})),
      body: Column(
        children: [
          Text(
            "FUNÇÕES x CLASSES",
            style: Style.defaultStyle.copyWith(fontSize: 22),
          ),
          const SizedBox(height: 15),

          // FUNÇÕES --------------------------------
          _widgetRed("VERMELHO"),
          const SizedBox(height: 15),
          // CLASSES --------------------------------
          const WidgetGreen(
            title: "VERDE",
          )
        ],
      ),
    );
  }

  Container _widgetRed(String title) {
    print("object Red");
    return Container(
        height: 200,
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Dados da página inicial $title",
              style: Style.whiteStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}

class WidgetGreen extends StatelessWidget {
  const WidgetGreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    print("object Green");
    return Container(
        height: 200,
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Dados da página inicial VERDE",
              style: Style.whiteStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
