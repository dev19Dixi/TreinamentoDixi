import 'package:flutter/material.dart';

class ErrorModule extends StatelessWidget {
  const ErrorModule({super.key, required this.route});
  final String route;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("404 - Rota: $route não defina"));
  }
}
