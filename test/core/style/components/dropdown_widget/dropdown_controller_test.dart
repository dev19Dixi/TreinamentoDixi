// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart' show FlutterError;
import 'package:flutter_test/flutter_test.dart';
import 'package:treinamento_mvvm/core/style/components/dropdown_widget/dropdown_controller.dart';

void main() {
  late DropdownController<String> controller;

  setUp(() {
    controller = DropdownController<String>(
      fetchInitialData: () async => ['A', 'B', 'C'],
      onSelected: (_) {},
      fetchFilter: (query) async => ['Filtered $query'],
    );
  });

  tearDown(() {
    controller.disposeController();
  });

  test('Should loadInitial loads data with model', () async {
    await controller.loadInitial(null);
    expect(controller.items, ['A', 'B', 'C']);
  });

  test('Should loadInitial loads data', () async {
    await controller.loadInitial('B');
    expect(controller.selected, 'B');
    expect(controller.lines, 3); // maxLines logic
  });

  test('Should Set selected Item', () async {
    await controller.loadInitial('B');
    expect(controller.selected, 'B');

    controller.setSelected('C');
    expect(controller.selected, 'C');
    expect(controller.selected, isNot('B'));
  });

  test('Should Set Max Lines with theses Item', () async {
    await controller.loadInitial(null);
    expect(controller.lines, 3);
  });

  test('Should load Filtered list by passing by Params in Controller', () async {
    String test = 'test';
    await controller.loadInitial(null);
    controller.search(test);
    await Future.delayed(Duration(milliseconds: 600)); // wait debounce
    expect(controller.items, ['Filtered $test']);
  });

  test('Should load Filtered list By local Filter(by text)', () async {
    // Remove fetchFilter
    // Add isFilerLocal
    controller = DropdownController<String>(
      fetchInitialData: () async => ['Teste 1', 'Teste 2', 'Teste 11'],
      onSelected: (_) {},
      isFilerLocal: true,
    );
    await controller.loadInitial(null);
    controller.search('test');
    await Future.delayed(Duration(milliseconds: 600)); // wait debounce
    expect(controller.items, ['Teste 1', 'Teste 2', 'Teste 11']);

    controller.search('1');
    await Future.delayed(Duration(milliseconds: 600)); // wait debounce
    expect(controller.items, ['Teste 1', 'Teste 11']);

    controller.search('2');
    await Future.delayed(Duration(milliseconds: 600)); // wait debounce
    expect(controller.items, ['Teste 2']);

    controller.search('Corinthians');
    await Future.delayed(Duration(milliseconds: 600)); // wait debounce
    expect(controller.items, []);
  });

  test('setSelected updates selected value', () async {
    await controller.loadInitial(null);
    controller.setSelected('C');
    expect(controller.selected, 'C');
  });

  test('toggleDropdown toggles isOpen', () {
    controller.toggleDropdown();
    expect(controller.isOpen, true);
    controller.toggleDropdown();
    expect(controller.isOpen, false);
  });

  test('closeDropdown sets isOpen to false', () {
    controller.toggleDropdown();
    controller.closeDropdown();
    expect(controller.isOpen, false);
  });

  test('Open sets isOpen to false', () {
    controller.toggleDropdown();
    expect(controller.isOpen, true);
  });

  test('formatter should format non-string types correctly', () async {
  final formatterController = DropdownController<int>(
    fetchInitialData: () async => [10, 20],
    onSelected: (_) {},
    formatter: (value) => 'Age $value',
  );

  await formatterController.loadInitial(null);

  final formatted = formatterController.formatter?.call(10);
  expect(formatted, 'Age 10');
});


  test('Should show error flutter in asserts that cannot use isFilerLocal', () {
    expect(
      () => DropdownController<int>(
        // ❌ T is int, cannot use local filter
        fetchInitialData: () async => [1, 2, 3],
        onSelected: (_) {},
        isFilerLocal: true,
      ),
      throwsA(isA<FlutterError>()),
    );
  });

  test('Should show error flutter in asserts need to use formatter', () {
    expect(
      () => DropdownController<int>(
        // ❌ T is int, but no formatter given
        fetchInitialData: () async => [1, 2, 3],
        onSelected: (_) {},
      ),
      throwsA(isA<FlutterError>()),
    );
  });

  test('Should NOT throw error when using formatter with non-String type', () {
    expect(
      () => DropdownController<int>(
        fetchInitialData: () async => [1, 2, 3],
        onSelected: (_) {},
        formatter: (value) => 'Number: $value',
      ),
      returnsNormally,
    );
  });

  test('Should NOT throw error when T is String and using local filter', () {
    expect(
      () => DropdownController<String>(
        fetchInitialData: () async => ['a', 'b', 'c'],
        onSelected: (_) {},
        isFilerLocal: true,
      ),
      returnsNormally,
    );
  });

 

}
