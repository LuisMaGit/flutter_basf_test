import 'dart:io';
import 'package:flutter_basf_test/core/services/network_service/network_service_respose.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  Future<NetworkServiceResponse> get(Uri uri) async {
    try {
      final response = await http.get(uri);
      if (response.statusCode == HttpStatus.ok) {
        return NetworkServiceResponse(
          success: true,
          body: response.body,
        );
      }
      return NetworkServiceResponse(
        success: false,
      );
    } on Exception {
      return NetworkServiceResponse(
        success: false,
      );
    }
  }
}
