import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:treinamento_mvvm/modules/position/pages/initial_page/initial_page_controller.dart';
import 'package:treinamento_mvvm/modules/position/pages/initial_page/widgets/button_widget.dart';

void main() {
  group('ButtonWidget', () {
    testWidgets('initial state shows "Valor Não Alterado"', (tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => InitialPageController(),
          child: const MaterialApp(
            home: Scaffold(body: ButtonWidget()),
          ),
        ),
      );

      // Text should show default value
      expect(find.text('Teste Component: Valor Não Alterado'), findsOneWidget);
      expect(find.byType(Checkbox), findsOneWidget);
    });

    testWidgets('tapping checkbox updates text', (tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => InitialPageController(),
          child: const MaterialApp(
            home: Scaffold(body: ButtonWidget()),
          ),
        ),
      );

      // Initially not changed
      expect(find.text('Teste Component: Valor Não Alterado'), findsOneWidget);

      // Tap on checkbox
      await tester.tap(find.byType(Checkbox));
      await tester.pumpAndSettle();

      // Should update
      expect(find.text('Teste Component: Valor alterado'), findsOneWidget);

      // Tap on checkbox again
      await tester.tap(find.byType(Checkbox));
      await tester.pumpAndSettle();

      //Expect the first state
      expect(find.text('Teste Component: Valor Não Alterado'), findsOneWidget);
    });
  });
}
