import 'dart:convert';

import 'package:http/http.dart' as http;

import '../failures/error_handler.dart';
import '../failures/failures.dart';
import '../log/debug_log.dart';
import 'config_headers.dart';

enum RequestsType { get, post, put, delete, patch }

class RequestApiService {
  final bool isToPrintRequest = true;
  final bool isToPrintBody = true;
  final bool isToPrintToken = true;

  ///Return : [Map<String, dynamic>] MapResponse
  ///
  ///If Erro: throw [IDixiFailure]
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

  ///Return : [String] stringResponse
  ///
  ///If Erro: throw [IDixiFailure]
  ///
  ///To use [String] stringResponse do => json.decode(stringResponse)
  Future<String> requestString(RequestsType requestsType, Uri uri, {String token = '', Object? body, String entity = ''}) async {
    try {
      final response = await _requestType(requestsType, uri, token, body, entity);
      ErrorHandler.checkError(response.statusCode);
      String stringResponse = utf8.decode(response.bodyBytes).replaceAll(":null", ":\"\"");
      return stringResponse;
    } on IDixiFailure catch (e) {
      DebugLog().error(e.message);
      rethrow;
    } catch (e) {
      throw UnexpectedFailure();
    }
  }

  Future<http.Response> _requestType(RequestsType requestsType, Uri uri, String token, Object? body, String entity) async {
    if (isToPrintRequest) _printRequest(requestsType, uri, token, body, entity);
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

  void _printRequest(RequestsType requestsType, Uri uri, String token, Object? body, String entity) {
    final log = DebugLog();

    final obscuredToken = token.length > 10 ? '${token.substring(0, 6)}...${token.substring(token.length - 4)}' : token;

    final buffer = StringBuffer();

    buffer.writeln('📤 API REQUEST [$entity]');
    buffer.writeln('🔹 Method: ${requestsType.name.toUpperCase()}');
    buffer.writeln('🔹 URL: ${uri.toString()}');

    if (isToPrintToken) {
      buffer.writeln('🔹 Token: $obscuredToken');
    }

    if (isToPrintBody) {
      buffer.writeln('🔹 Body: ${body ?? 'N/A'}');
    }

    log.debug(buffer.toString());
  }
}
