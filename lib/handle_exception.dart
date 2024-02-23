import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';

class HandleException {
  dynamic returnResponse({required Response response}) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.bodyString!);
      case 201:
        return jsonDecode(response.bodyString!);
      case 422:
        return jsonDecode(response.bodyString!);
      case 502:
        return jsonDecode(response.bodyString!);
      case 400:
        throw Exception('Bad Request');
        // case 401:
        //   return defaultLogoutDialog('Unauthorised');
        throw Exception('Unauthorised');
      case 403:
        throw Exception('Forbidden');
      case 408:
        throw Exception('Request Timeout');
      case 429:
        throw Exception('Too Many Requests');
      default:
        throw Exception('Unknown Error: ${response.statusCode}');
    }
  }
}
