import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:treinamento_mvvm/core/failures/error_handler.dart';
import 'package:treinamento_mvvm/core/failures/failures.dart';
import 'package:treinamento_mvvm/core/request/request.dart';

import 'request_api_test.mocks.dart';

const String endpoint = '/user';
final Uri pulicApi = Uri.parse("https://mockapi.io/projects/68408aa95b39a8039a586abd/$endpoint");
final Uri uriMock = Uri.parse("https://mocktest.com");

@GenerateMocks([RequestApiService])
void main() {
  late MockRequestApiService mockRequestApiService;
  late RequestApiService requestApiService;
  setUpAll(() {
    mockRequestApiService = MockRequestApiService();
    requestApiService = RequestApiService();
  });

  group("Grupo de teste de Failures", () {
    test("Success - 200 - GET A", () async {
      var result = await requestApiService.request(RequestsType.get, pulicApi);

      expect(result, isA<Map<String, dynamic>>());
    });

       test("Success - 200 - GET LIST", () async {
      var result = await requestApiService.request(RequestsType.get, pulicApi);

      expect(result, isA<Map<String, dynamic>>());
    });

    
       test("Success - 200 - POST", () async {
      var result = await requestApiService.request(RequestsType.get, pulicApi);

      expect(result, isA<Map<String, dynamic>>());
    });

   test("Success - 200 - PUT", () async {
      var result = await requestApiService.request(RequestsType.get, pulicApi);

      expect(result, isA<Map<String, dynamic>>());
    });

   test("Success - 200 - GET", () async {
      var result = await requestApiService.request(RequestsType.get, pulicApi);

      expect(result, isA<Map<String, dynamic>>());
    });


    test("Error - 400", () async {
      when(mockRequestApiService.request(RequestsType.get, uriMock)).thenAnswer((_) async {
        ErrorHandler.checkError(400);
        return;
      });

      try {
        var response = await mockRequestApiService.request(RequestsType.get, uriMock);
        expect(response, null);
      } on IDixiFailure catch (e) {
        expect(e, isA<FormatFailure>());
        expect(e.message, FormatFailure().message);
      }
    });

    test("Error - 401", () async {
      when(mockRequestApiService.request(RequestsType.get, uriMock)).thenAnswer((_) async {
        ErrorHandler.checkError(401);
        return;
      });

      try {
        var response = await mockRequestApiService.request(RequestsType.get, uriMock);
        expect(response, null);
      } on IDixiFailure catch (e) {
        expect(e, isA<NoAccessFailure>());
        expect(e.message, NoAccessFailure().message);
      }
    });

    test("Error - 404", () async {
      when(mockRequestApiService.request(RequestsType.get, uriMock)).thenAnswer((_) async {
        ErrorHandler.checkError(404);
        return;
      });

      try {
        var response = await mockRequestApiService.request(RequestsType.get, uriMock);
        expect(response, null);
      } on IDixiFailure catch (e) {
        expect(e, isA<FormatFailure>());
        expect(e.message, FormatFailure().message);
      }
    });

    test("Error - 500", () async {
      when(mockRequestApiService.request(RequestsType.get, uriMock)).thenAnswer((_) async {
        ErrorHandler.checkError(500);
        return;
      });

      try {
        var response = await mockRequestApiService.request(RequestsType.get, uriMock);
        expect(response, null);
      } on IDixiFailure catch (e) {
        expect(e, isA<ServerFailure>());
        expect(e.message, ServerFailure().message);
      }
    });
  });
}
