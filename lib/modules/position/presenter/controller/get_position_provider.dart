import 'package:flutter/material.dart';

import '../../data/model/positition_model.dart';
import '../../data/services/abstract_position_service.dart';

class GetPositionProvider extends ChangeNotifier {
  IPositionService service;

  GetPositionProvider(this.service);

  late PositionModel _position;
  bool _isLoading = false;
  String? _error;

  int totalOfPages = 0;
  int totalElements = 0;

  PositionModel get position => _position;

  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> getPosition(int id) async {
    _isLoading = true;
    notifyListeners();

    try {
      var dataResponse = await service.getPosition(id);

      if (dataResponse != null) {
        _error = null;
        _position = dataResponse;
      }

      if (dataResponse == null) {
        _error = "Some error happened";
      }
    } catch (e) {
      _error = 'Um erro ocorreu ao requisitar o cargo';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
