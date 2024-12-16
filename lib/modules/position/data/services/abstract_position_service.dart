import 'package:treinamento_mvvm/modules/position/data/model/positition_model.dart';

abstract class IPositionService {
  Future<List<PositionModel>?> getAllPositions();
  Future<String> deletePosition(String id);
  Future<String> updatePosition(PositionModel positionModel);
  Future<String> createPosition(PositionModel positionModel);
  Future<PositionModel?> getPosition(String id);
}