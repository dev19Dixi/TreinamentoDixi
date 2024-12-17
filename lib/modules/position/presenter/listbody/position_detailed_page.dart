import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/get_list_position_provider.dart';

class PositionDetailedPage extends StatelessWidget {
  const PositionDetailedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Página Dependencie Injection"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<GetListPositionProvider>().getListPosition(true);
      }),
      body: Consumer<GetListPositionProvider>(
        builder: (_, provider, child) {
          var listPosition = provider.listPosition;
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listPosition.length,
                    itemBuilder: (_, index) => ListTile(
                          onTap: () {},
                          title: Text(
                              "${listPosition[index].name} | ${listPosition[index].email}"),
                        ))
              ],
            ),
          );
        },
      ),
    );
  }
}
