import 'package:treinamento_mvvm/core/failures/failures.dart';

class ErrorHandler {
  ///Check error HTTP
  ///
  ///if yes, throw Some Exception from StatusCode
  ///
  ///if not, do nothing 
  static void checkError(int statusCode) {
    if (statusCode >= 200 && statusCode < 300) return;

    if (statusCode >= 500) {
      throw ServerFailure();
    }

    if (statusCode == 400 || statusCode == 404) {
      throw FormatFailure();
    }

    if (statusCode > 400) {
      throw NoAccessFailure();
    }

    throw UnexpectedFailure();
  }

}
