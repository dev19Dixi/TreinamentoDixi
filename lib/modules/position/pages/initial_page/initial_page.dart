import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treinamento_mvvm/core/style/build_context.dart';
import 'package:treinamento_mvvm/modules/position/controllers/navigation_controller.dart';

import 'initial_page_controller.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key, required this.controller});

  final InitialPageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("This First page in  Position Module"),
        TextButton(
            onPressed: () {
              context.read<NavigationPositionController>().changeRoute("/:id");
            },
            child: const Column(
              children: [
                Text("Go to Policy Page"),
              ],
            )),
        OutlinedButton(
            onPressed: () {},
            child: Text(
              "Outlined Button without style",
              style: context.styles.primaryText,
            )),
        const SizedBox(height: 10),
        ElevatedButton(onPressed: () {}, child: const Text("Elevated Button without style")),
        const SizedBox(height: 15),
        TextButton(onPressed: () {}, child: const Text("Catch internet excpetion request")),
        TextButton(onPressed: () {}, child: const Text("Catch 401 excpetion request")),
        TextButton(onPressed: () {}, child: const Text("Catch 402 excpetion request")),
        TextButton(onPressed: () {}, child: const Text("Catch 404 excpetion request")),
        TextButton(onPressed: () {}, child: const Text("Catch 500 excpetion request")),
      ],
    );
  }
}
