import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treinamento_mvvm/core/text_style.dart';
import 'package:treinamento_mvvm/modules/position/presenter/controller/get_list_position_provider.dart';

import 'offline_list_position_page.dart';

class ListPositionPage extends StatefulWidget {
  const ListPositionPage({super.key});

  @override
  State<ListPositionPage> createState() => _ListPositionPageState();
}

class _ListPositionPageState extends State<ListPositionPage> {
  late GetListPositionProvider getListPositionProvider;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getListPositionProvider =
          Provider.of<GetListPositionProvider>(context, listen: false);
      getListPositionProvider.getListPosition(true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var providerWatch = context.watch<GetListPositionProvider>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => getListPositionProvider.getListPosition(false)),
      appBar: AppBar(
        title: const Text("Página em list"),
      ),
      body: Consumer<GetListPositionProvider>(
        builder: (_, provider, child) {
          if (provider.isLoading) {
            return const LoadingGetListPositionWidget();
          }
          if (provider.error != null) {
            return const ErrorGetListPositionWidget();
          }
          return const SuccessGetListPositionWidget();
        },
      ),
    );
  }
}

class SuccessGetListPositionWidget extends StatelessWidget {
  const SuccessGetListPositionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<GetListPositionProvider>(
      builder: (BuildContext context, GetListPositionProvider provider,
              Widget? child) =>
          SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: provider.listPosition.length,
                itemBuilder: (_, index) => ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const OfflineListPositionPage(),
                          ),
                        );
                      },
                      title: Text(
                          "${provider.listPosition[index].name} | ${provider.listPosition[index].email}"),
                      trailing: const Icon(Icons.chevron_right),
                    ))
          ],
        ),
      ),
    );
  }
}

class ErrorGetListPositionWidget extends StatelessWidget {
  const ErrorGetListPositionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<GetListPositionProvider>(
      builder: (BuildContext context, GetListPositionProvider provider,
              Widget? child) =>
          Center(
              child: Text(
        provider.error!,
        style: Style.darkStyle.copyWith(fontSize: 20),
      )),
    );
  }
}

class LoadingGetListPositionWidget extends StatelessWidget {
  const LoadingGetListPositionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
