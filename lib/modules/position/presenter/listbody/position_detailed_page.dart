import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/text_style.dart';
import '../controller/get_position_provider.dart';

class PositionDetailedPage extends StatefulWidget {
  const PositionDetailedPage({super.key, required this.idPosition});

  final int idPosition;

  @override
  State<PositionDetailedPage> createState() => _PositionDetailedPageState();
}

class _PositionDetailedPageState extends State<PositionDetailedPage> {
  late GetPositionProvider getPositionProvider;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getPositionProvider =
          Provider.of<GetPositionProvider>(context, listen: false);
      getPositionProvider.getPosition(widget.idPosition);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Página de detalhes de Cargo"),
      ),
      body: Consumer<GetPositionProvider>(builder: (_, getProvider, child) {
        if (getProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (getProvider.error != null) {
          return Text(
            getProvider.error!,
            style: Style.darkStyle.copyWith(fontSize: 20),
          );
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Name: ${getProvider.position.name}"),
                Text("Email: ${getProvider.position.email}"),
                Text("desc: ${getProvider.position.description}"),
                Text("Active: ${getProvider.position.isActive}"),
                Text("Name: ${getProvider.position.name}"),
              ],
            ),
          ],
        );
      }),
    );
  }
}
