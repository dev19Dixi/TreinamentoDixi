import 'dart:async';

import 'package:flutter/material.dart';

import 'widgets/dropdown_asserts.dart';

class DropdownController<T> extends ChangeNotifier {
  DropdownController({
    required this.fetchInitialData,
    required this.onSelected,
    this.value,
    this.fetchFilter,
    this.formatter,
    this.fetchNewPage,
    this.isLoading = false,
    this.isFilerLocal = false,
    this.hintText,
    this.height = 30,
    this.maxLines,
  }) : assert(assertValidFilter<T>(isFilerLocal)),
       assert(assertFormatter<T>(formatter));

  // --- Functions ---
  /// Function that returns the initial data for the dropdown.
  ///
  /// Example:
  /// ```dart
  /// Future<List<String>> _fetchDataApi() async {
  ///   await Future.delayed(const Duration(seconds: 2));
  ///   return ['Test 1', 'Test 2', 'Test 3'];
  /// }
  /// ```
  ///
  /// If the data is already available or static, you can use:
  /// ```dart
  /// fetchInitialData: () async => ['Data 1', 'Data 2', 'Data 3']
  /// ```
  final Future<List<T>> Function() fetchInitialData;

  /// Function that applies a **custom filter** to the dropdown items.
  ///
  /// Use this when you want to fetch filtered data from an API or database.
  ///
  /// Example:
  /// ```dart
  /// fetchFilter: (text) async {
  ///   return provider.getUsersByName(text);
  /// }
  /// ```
  final Future<List<T>> Function(String text)? fetchFilter;

  /// Enables **local filtering** on already loaded items.
  ///
  /// When `true`, filtering is applied locally using the `searchController.text`
  /// instead of fetching from an external source.
  ///
  /// Example:
  /// ```dart
  /// final items = ['A1', 'B2', 'C3', 'D4', 'A4', 'B3'];
  ///
  /// input: "A"
  /// output: ['A1', 'A4']
  /// ```
  final bool isFilerLocal;

  /// Callback triggered when an item is selected.
  ///
  /// Example:
  /// ```dart
  /// onSelected: (value) {
  ///   initialValue = value;
  ///   print('User selected: $initialValue');
  /// }
  /// ```
  final void Function(T? value) onSelected;

  /// Function to **format the displayed text** for items.
  ///
  /// This is required when `T` is not a `String`.
  ///
  /// Example:
  /// ```dart
  /// formatter: (user) => 'Age: ${user.age}, Name: ${user.name}'
  /// ```
  final String Function(T value)? formatter;

  /// ❌ Function Not implemented Yet
  final Future<List<T>> Function()? fetchNewPage;

   // ---------------------------
  // Design
  // ---------------------------

  /// Height of each dropdown item (in pixels).
  ///
  /// Default: `30`.
  final double height;

  /// Number of lines (rows) visible in the dropdown.
  ///
  /// This value is dynamically updated when items are loaded
  /// to avoid rendering more lines than available items.
  ///
  /// Default: `7`.
  int lines = 7;

  /// Placeholder text shown when no value is selected.
  ///
  /// Example:
  /// ```dart
  /// hintText: 'Select an option'
  /// ```
  final String? hintText;

  /// Maximum number of lines to display in the dropdown list.
  ///
  /// If `null`, the number of lines will adjust dynamically
  /// based on the number of items available.
  final int? maxLines;

  /// Height of the search text field (in pixels).
  ///
  /// Default: `50`.
  final double heightTextField = 50;

  // ----- Management -----

  /// The Initial and Currently selected value.
  ///
  /// Example:
  /// ```dart
  /// value: 'Teste1'
  /// ```
  /// 
  /// By this way, it will Start the DropDown with "Teste 1"
  final T? value;
  final bool isLoading;
  final List<T> _items = [];
  final List<T> _itemsFilter = [];
  bool _isOpen = false;
  bool _isLoading = false;
  T? _selected;
  bool _hasMore = true;

  List<T> get items => _itemsFilter.isNotEmpty || _textFilter.isNotEmpty ? _itemsFilter : _items;
  bool get isOpen => _isOpen;
  T? get selected => _selected;
  bool get hasMore => _hasMore;

  final TextEditingController searchController = TextEditingController();
  final debounceDuration = const Duration(milliseconds: 500);
  Timer? _debounce;
  String _textFilter = '';

  Future<void> loadInitial(T? selectedValue) async {
    _setLoading(true);
    final data = await fetchInitialData();
    _items.clear();
    _items.addAll(data);
    _setSelected(selectedValue);
    _hasMore = data.isNotEmpty;
    lines = _setMaxLines();
    _setLoading(false);
  }

  Future<void> loadMore() async {
    if (fetchNewPage != null && _hasMore && !_isLoading) {
      _setLoading(true);
      final data = await fetchNewPage!();
      _items.addAll(data);
      if (data.isEmpty) _hasMore = false;
      _setLoading(false);
    }
  }

  void search(String text) {
    _textFilter = text;
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(debounceDuration, () async {
      _itemsFilter.clear();
      if (isFilerLocal && _textFilter.isNotEmpty) {
        _setLoading(true);
        var results = _localFilterText(_textFilter);
        _itemsFilter.addAll(List.from(results));
        _setLoading(false);
      } else if (fetchFilter != null && _textFilter.isNotEmpty) {
        _setLoading(true);
        final results = await fetchFilter!(_textFilter);
        _itemsFilter.addAll(List.from(results));
        _setLoading(false);
      }
      notifyListeners();
    });
  }

  getMaxHeight() {
    bool isUsingFilter = fetchFilter != null || isFilerLocal;
    double adicionalSpace = isUsingFilter ? heightTextField : 0;
    return (40 * (maxLines ?? lines) + adicionalSpace);
  }

  String formatValue(T? value) {
    if (formatter != null) {
      return formatter!(value as T);
    }
    return value?.toString() ?? '';
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setSelected(T? value) {
    _selected = value;
    notifyListeners();
  }

  void setSelected(T? value) => _setSelected(value);
  void toggleDropdown() {
    _isOpen = !_isOpen;
    notifyListeners();
  }

  void closeDropdown() {
    _isOpen = false;
    notifyListeners();
  }

  void disposeController() {
    _debounce?.cancel();
    searchController.dispose();
  }

  List<String> _localFilterText(String text) {
    var items = _items as List<String>;
    var newList = items.where((e) => e.toLowerCase().contains(text.toLowerCase())).toList();
    return newList;
  }

  int _setMaxLines() {
    if (_items.length > 6) {
      lines = 6;
    } else {
      lines = _items.length;
    }
    return lines;
  }
}
