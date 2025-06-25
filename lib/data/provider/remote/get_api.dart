import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;

import '/core/constants/strings.dart';

class GetApi {
  const GetApi();

  Future<http.Response> getRawData({required String path}) async {
    final http.Response response;
    final url = Uri.parse("$baseUrl$path");

    try {
      response = await http.get(url).timeout(const Duration(seconds: 10));
    } on TimeoutException {
      return http.Response('{"error": "Timed out"}', 500);
    } on SocketException {
      return http.Response('{"error": "No Internet"}', 500);
    } on HttpException {
      return http.Response('{"error": "No Service Found"}', 500);
    } on FormatException {
      return http.Response('{"error": "Invalid Data Format"}', 500);
    } catch (e) {
      return http.Response('{"error": ${e.toString()}}', 500);
    }

    return response;
  }
}
