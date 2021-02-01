import "dart:convert";
import "dart:io";
import "package:dio/dio.dart";
import "api_exception.dart";

class APIBaseHelper {
  final String _baseUrl = "https://apilaravel.teknoguna.com/api_simple_customer/";
  Dio _dio = Dio();

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await _dio.get(_baseUrl + url);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<dynamic> post(String url, {FormData formData}) async {
    var responseJson;
    try {
      final response = await _dio.post(_baseUrl + url, data: formData);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection");
    }
    return responseJson;
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.statusMessage);
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.statusMessage);
      case 401:
      case 403:
        throw UnauthorisedException(response.statusMessage);
      case 500:
      default:
        throw FetchDataException(
            "Error occured while communication with server with status code : ${response.statusCode}");
    }
  }

}