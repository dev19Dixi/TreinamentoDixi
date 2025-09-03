import 'dart:async';
import 'package:flutter/material.dart';

/// --- Sub Controllers ---

class DropdownDataController<T> {
  final Future<List<T>> Function() fetchInitialData;
  final Future<List<T>> Function(String text)? fetchFilter;
  final Future<List<T>> Function()? fetchNewPage;

  DropdownDataController({
    required this.fetchInitialData,
    this.fetchFilter,
    this.fetchNewPage,
  });

  final List<T> _items = [];
  final List<T> _itemsFilter = [];
  bool _hasMore = true;

  List<T> get items => _itemsFilter.isNotEmpty ? _itemsFilter : _items;
  bool get hasMore => _hasMore;

  Future<List<T>> loadInitial() async {
    final data = await fetchInitialData();
    _items.clear();
    _items.addAll(data);
    _hasMore = data.isNotEmpty;
    return data;
  }

  Future<List<T>> loadMore() async {
    if (fetchNewPage == null || !_hasMore) return [];
    final data = await fetchNewPage!();
    if (data.isEmpty) _hasMore = false;
    _items.addAll(data);
    return data;
  }

  Future<List<T>> filter(String text) async {
    if (fetchFilter == null || text.isEmpty) return _items;
    final results = await fetchFilter!(text);
    _itemsFilter
      ..clear()
      ..addAll(results);
    return results;
  }

  void clearFilter() => _itemsFilter.clear();
}

class DropdownUiController<T> extends ChangeNotifier {
  bool _isOpen = false;
  bool _isLoading = false;
  T? _selected;
  int lines = 7;

  bool get isOpen => _isOpen;
  bool get isLoading => _isLoading;
  T? get selected => _selected;

  void toggle() {
    _isOpen = !_isOpen;
    notifyListeners();
  }

  void close() {
    _isOpen = false;
    notifyListeners();
  }

  void setSelected(T? value) {
    _selected = value;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  int setMaxLines(int itemCount, {int max = 6}) {
    lines = itemCount > max ? max : itemCount;
    return lines;
  }
}

/// --- Main Controller (composition) ---

class DropdownController<T> extends ChangeNotifier {
  DropdownController({
    required Future<List<T>> Function() fetchInitialData,
    required this.onSelected,
    this.fetchFilter,
    this.fetchNewPage,
    this.formatter,
    this.value,
    this.isFilerLocal = false,
    this.height = 30,
    this.hintText,
    this.maxLines,
  }) : dataController = DropdownDataController<T>(
         fetchInitialData: fetchInitialData,
         fetchFilter: fetchFilter,
         fetchNewPage: fetchNewPage,
       );

  // Delegated sub-controllers
  final DropdownDataController<T> dataController;
  final DropdownUiController<T> uiController = DropdownUiController<T>();

  // Params
  final Future<List<T>> Function(String text)? fetchFilter;
  final Future<List<T>> Function()? fetchNewPage;
  final void Function(T? value) onSelected;
  final String Function(T value)? formatter;
  final bool isFilerLocal;

  // Design
  final double height;
  final String? hintText;
  final int? maxLines;

  // State
  final T? value;
  final TextEditingController searchController = TextEditingController();
  final debounceDuration = const Duration(milliseconds: 500);
  Timer? _debounce;


  /// Public Getters (aggregate from subcontrollers)
  List<T> get items => dataController.items;
  bool get isOpen => uiController.isOpen;
  bool get isLoading => uiController.isLoading;
  T? get selected => uiController.selected;
  bool get hasMore => dataController.hasMore;

  /// Initial load
  Future<void> loadInitial() async {
    uiController.setLoading(true);
    final data = await dataController.loadInitial();
    uiController.setSelected(value);
    uiController.setMaxLines(data.length, max: maxLines ?? 6);
    uiController.setLoading(false);
    notifyListeners();
  }

  /// Load more
  Future<void> loadMore() async {
    if (!uiController.isLoading && hasMore) {
      uiController.setLoading(true);
      await dataController.loadMore();
      uiController.setLoading(false);
      notifyListeners();
    }
  }

  /// Search with debounce
  void search(String text) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(debounceDuration, () async {
      uiController.setLoading(true);
      await dataController.filter(text);
      uiController.setLoading(false);
      notifyListeners();
    });
  }

  String formatValue(T? value) {
    if (formatter != null && value != null) return formatter!(value);
    return value?.toString() ?? '';
  }

  void setSelected(T? value) {
    uiController.setSelected(value);
    onSelected(value);
  }

  void toggleDropdown() => uiController.toggle();
  void closeDropdown() => uiController.close();

  double getMaxHeight() {
    final isUsingFilter = fetchFilter != null || isFilerLocal;
    final extraSpace = isUsingFilter ? 50 : 0;
    return (40 * (maxLines ?? uiController.lines) + extraSpace).toDouble();
  }

  void disposeController() {
    _debounce?.cancel();
    searchController.dispose();
  }

  
}
