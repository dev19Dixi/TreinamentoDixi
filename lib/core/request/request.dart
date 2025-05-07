import 'dart:convert';

import 'package:http/http.dart' as http;

import '../failures/error_handler.dart';
import '../failures/failures.dart';
import 'config_headers.dart';

enum RequestsType { get, post, put, delete, patch }

class RequestApiService {
  ///Return a [String] or a [IDixiFailure]
  Future<Map<String, dynamic>?> request(RequestsType requestsType, Uri uri, {String token = '', Object? body, String entity = ''}) async {
    try {
      final response = await _requestType(requestsType, uri, token, body, entity);
      ErrorHandler.checkError(response.statusCode);
      var jsonMap = json.decode(utf8.decode(response.bodyBytes).replaceAll(":null", ":\"\""));
      return jsonMap;
    } on IDixiFailure {
      rethrow;
    } catch (e) {
      throw UnexpectedFailure();
    }
  }

  Future<http.Response> _requestType(RequestsType requestsType, Uri uri, String token, Object? body, String entity) async {
    switch (requestsType) {
      case RequestsType.get:
        return await http.get(uri, headers: ConfigHeaders.getHeaderToken(token, entity));
      case RequestsType.post:
        return await http.post(uri, headers: ConfigHeaders.getHeaderToken(token, entity), body: (body));
      case RequestsType.put:
        return await http.put(uri, headers: ConfigHeaders.getHeaderToken(token, entity), body: (body));
      case RequestsType.delete:
        return await http.delete(uri, headers: ConfigHeaders.getHeaderToken(token, entity), body: (body));

      default:
        return http.Response('', 500);
    }
  }
}
