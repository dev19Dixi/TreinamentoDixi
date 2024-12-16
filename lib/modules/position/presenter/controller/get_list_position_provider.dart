import 'package:flutter/material.dart';

import '../../data/model/positition_model.dart';
import '../../data/services/abstract_position_service.dart';

class GetListPositionProvider extends ChangeNotifier {
  IPositionService service;

  GetListPositionProvider(this.service);

  List<PositionModel> _listPosition = [];
  bool _isLoading = false;
  bool _isEmpty = false;
  String? _error;

  int totalOfPages = 0;
  int totalElements = 0;

  List<PositionModel> get listPosition => _listPosition;

  List<Map<String, dynamic>> get listPositionAsMap {
    var newList = _listPosition.map((e) => e.toMap()).toList();
    return newList;
  }

  bool get isEmpty => _isEmpty;

  bool get isLoading => _isLoading;
  String? get error => _error;

  // Fetch data from API
  Future<void> getListPosition() async {
    _isLoading = true;
    notifyListeners();

    try {
      var dataResponse = await service.getAllPositions();

      if (dataResponse != null) {
        if (dataResponse.isNotEmpty) {
          _listPosition = dataResponse;
          _isEmpty = _listPosition.isEmpty;
        }
      }

      if (dataResponse == null || dataResponse.isEmpty) {
        throw ("Some error happened");
      }
    } catch (e) {
      _isEmpty = false;
      _error = 'Um erro ocorreu ao requisitar o cargo';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
