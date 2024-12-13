import 'package:flutter/material.dart';

class PositionInitialPage extends StatefulWidget {
  const PositionInitialPage({super.key});

  @override
  State<PositionInitialPage> createState() => _PositionInitialPageState();
}

class _PositionInitialPageState extends State<PositionInitialPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Página inicial"),
      ),
      body: Column(
        children: [
          Container(
              height: 200,
              color: Colors.red,
              child: const Row(
                children: [
                  Text("Dados da página inicial VERMELHOR"),
                ],
              )),
          const SizedBox(
            height: 15,
          ),
          Container(
              height: 200,
              color: Colors.green,
              child: const Row(
                children: [
                  Text("Dados da página inicial VERDE"),
                ],
              )),
        ],
      ),
    );
  }
}
