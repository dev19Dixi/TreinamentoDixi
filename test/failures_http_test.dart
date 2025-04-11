import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:treinamento_mvvm/core/failures/error_handler.dart';
import 'package:treinamento_mvvm/core/failures/failures.dart';

Uri uriMock = Uri.parse("https://example.com/data");

@GenerateMocks([http.Client])
void main() {
  group("Grupo de teste de throw Failures", () {
    test("Success - 200", () async {
      var client = MockClient((_) async => http.Response(jsonEncode({'message': 'Mocked success'}), 200));

      final response = await client.get(uriMock);

      expect(response.statusCode, 200);
      expect(jsonDecode(response.body), {'message': 'Mocked success'});
    });

    test("Bad Request - 400", () async {
      var client = MockClient((_) async => http.Response(jsonEncode({'message': 'Bad Request'}), 400));
      try {
        final response = await client.post(uriMock);
        ErrorHandler.checkError(response.statusCode);

        expect(response.statusCode, 200);
      } on IDixiFailure catch (e) {
        expect(e, isA<Exception>());
        expect(e, isA<IDixiFailure>());
        expect(e, isA<FormatFailure>());
        expect(e.message, FormatFailure().message);
      }
    });

    test("No Access - 401", () async {
      var client = MockClient((_) async => http.Response(jsonEncode({'message': 'Bad Request'}), 401));
      try {
        final response = await client.get(uriMock);
        ErrorHandler.checkError(response.statusCode);

        expect(response.statusCode, 200);
      } on IDixiFailure catch (e) {
        expect(e, isA<Exception>());
        expect(e, isA<IDixiFailure>());
        expect(e, isA<NoAccessFailure>());
        expect(e.message, NoAccessFailure().message);
      }
    });

    test("No Endpoint- 404", () async {
      var client = MockClient((_) async => http.Response(jsonEncode({'message': 'Bad Request'}), 404));
      try {
        final response = await client.get(uriMock);
        ErrorHandler.checkError(response.statusCode);

        expect(response.statusCode, 200);
      } on IDixiFailure catch (e) {
        expect(e, isA<Exception>());
        expect(e, isA<IDixiFailure>());
        expect(e, isA<FormatFailure>());
        expect(e.message, FormatFailure().message);
      }
    });

    test("Server Failure - 500", () async {
      var client = MockClient((_) async => http.Response(jsonEncode({'message': 'Bad Request'}), 500));
      try {
        final response = await client.get(uriMock);
        ErrorHandler.checkError(response.statusCode);

        expect(response.statusCode, 200);
      } on IDixiFailure catch (e) {
        expect(e, isA<Exception>());
        expect(e, isA<IDixiFailure>());
        expect(e, isA<ServerFailure>());
        expect(e.message, ServerFailure().message);
      }
    });
  });
}
