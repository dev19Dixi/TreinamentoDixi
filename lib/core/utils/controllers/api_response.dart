
import 'dart:convert';

class ApiResponse<T> {
  T data;
  String message = "";
  bool success = false;

  ApiResponse(
    this.data,
    this.message,
    this.success,
    );


  static Map toMap(ApiResponse apiResponse) {
    Map data = {
      'data': apiResponse.data,
      'message': apiResponse.message,
      'success': apiResponse.success,
    };
    return data;
  }

  Map toJson() {
    Map ret = {
      'data': data,
      'message': message,
      'success': success,
    };
    return ret;
  }

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
        json['data'],
        json['message'],
        json['success'],
    );
  }

  static List<ApiResponse> parseApiResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<ApiResponse>((json) => ApiResponse.fromJson(json)).toList();
  }

  static List<ApiResponse> parseListDynamic(List<dynamic> body) {
    return body.map<ApiResponse>((json) => ApiResponse.fromJson(json)).toList();
  }
}
