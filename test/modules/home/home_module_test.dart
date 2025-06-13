import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:treinamento_mvvm/modules/navigation/controllers/routes_provider.dart';
import 'package:treinamento_mvvm/core/style/theme/theme.dart';
import 'package:treinamento_mvvm/core/style/theme/theme_controller.dart';
import 'package:treinamento_mvvm/modules/home/controllers/navigation_home_controller.dart';
import 'package:treinamento_mvvm/modules/home/home_module.dart';
import 'package:treinamento_mvvm/modules/home/pages/detail_page/detail_page.dart';
import 'package:treinamento_mvvm/modules/home/pages/initial_page/initial_home_page.dart';


void main() {

  testWidgets('HomeModule navigation flow works', (WidgetTester tester) async {
    final navigationHomeController = NavigationHomeController();

    await tester.binding.setSurfaceSize(const Size(1200, 800));

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: RoutesProvider()),
          ChangeNotifierProvider(create: (_) => ThemeController()),
        ],
        child: MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,
          home: Scaffold(
            body: HomeModule(controller: navigationHomeController),
          ),
        ),
      ),
    );

    //check inital page
    expect(find.byType(InitialPage), findsOneWidget);

    //mock tap to change page
    navigationHomeController.changeRoute('/:id');
    await tester.pumpAndSettle();

    //check if changed page from inital to detail
    expect(find.byType(InitialPage), findsNothing);
    expect(find.byType(DetailPage), findsOneWidget);

    //mock return to initial page
    navigationHomeController.changeRoute('/');
    await tester.pumpAndSettle();

    //check if changed page from detail to initial
    expect(find.byType(InitialPage), findsOneWidget);
    expect(find.byType(DetailPage), findsNothing);
  });
}
