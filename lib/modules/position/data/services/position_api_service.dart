import 'package:treinamento_mvvm/modules/position/data/model/positition_model.dart';

import 'abstract_position_service.dart';

class PositionApiService implements IPositionService{
  static const String _endpoint = "";

  @override
  Future<String> createPosition(PositionModel positionModel) {
    throw UnimplementedError();
  }

  @override
  Future<String> deletePosition(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<PositionModel>?> getAllPositions() {
    throw UnimplementedError();
  }

  @override
  Future<PositionModel?> getPosition(String id) {
    throw UnimplementedError();
  }

  @override
  Future<String> updatePosition(PositionModel positionModel) {
    throw UnimplementedError();
  } 

}