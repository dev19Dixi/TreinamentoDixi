import 'package:flutter_test/flutter_test.dart';
import 'package:treinamento_mvvm/modules/position/pages/initial_page/initial_page_controller.dart';

void main() {
  group('InitialPageController', () {
    test('default value should be false', () {
      final controller = InitialPageController();

      expect(controller.hasChanged, false);
    });

    test('setting hasChanged should update the value', () {
      final controller = InitialPageController();

      controller.hasChanged = true;

      expect(controller.hasChanged, true);
    });

    test('notifyListeners should be called when hasChanged changes', () {
      final controller = InitialPageController();

      var listenerCalled = false;
      controller.addListener(() {
        listenerCalled = true;
      });

      controller.hasChanged = true;

      expect(listenerCalled, true);
    });

    test('notifyListeners should not be called if value is the same', () {
      final controller = InitialPageController();
      controller.hasChanged = false; // already false by default

      var listenerCalled = false;
      controller.addListener(() {
        listenerCalled = true;
      });

      controller.hasChanged = false; // no state change

      expect(listenerCalled, false);
    });
  });
}
