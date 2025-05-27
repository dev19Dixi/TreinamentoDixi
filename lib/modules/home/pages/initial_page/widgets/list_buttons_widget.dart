import 'package:flutter/material.dart';

class ListButtonsIwdget extends StatelessWidget {
  const ListButtonsIwdget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(onPressed: () {}, child: const Text("TextButton sem estilo")),
        const SizedBox(height: 8),
        ElevatedButton(onPressed: () {}, child: const Text("ElevatedButton sem estilo")),
        const SizedBox(height: 8),
        OutlinedButton(onPressed: () {}, child: const Text("OutlinedButton sem estilo")),
        const SizedBox(height: 8),
        FilledButton(onPressed: () {}, child: const Text("FilledButton sem estilo")),
      ],
    );
  }
}
