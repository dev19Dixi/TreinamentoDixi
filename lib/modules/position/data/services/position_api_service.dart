import 'package:treinamento_mvvm/modules/position/data/model/positition_model.dart';

import '../../../db/position_model_mock.dart';
import 'abstract_position_service.dart';

class PositionApiService implements IPositionService {
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
  Future<List<PositionModel>?> getAllPositions(bool withError) async {
    await Future.delayed(const Duration(seconds: 2));
    if (withError) {
      return [];
    }
    return mockPositions;
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
