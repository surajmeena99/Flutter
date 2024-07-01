import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'api_constant.dart';

Future<SecurityContext> get globalContext async {
  final sslCert = await rootBundle.load('assets/certificate.crt');
  SecurityContext securityContext = SecurityContext(withTrustedRoots: false);
  securityContext.setTrustedCertificatesBytes(sslCert.buffer.asInt8List());
  return securityContext;
}

Future<http.Client> getSSLPinningClient() async {
  HttpClient client = HttpClient(context: await globalContext);
  client.badCertificateCallback = (X509Certificate cert, String host, int port) => false;
  IOClient ioClient = IOClient(client);
  return ioClient;
}

class ApiService {
  final Future<http.Client> client;
  ApiService() : client = getSSLPinningClient();

  // Token to be added to headers
  String? authToken;

  // Method to set token
  void setAuthToken(String? token) {
    authToken = token;
  }

  // Method to handle common headers
  Map<String, String> _getHeaders() {
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      if (authToken != null) 'Authorization': 'Bearer $authToken',
    };
  }

  // Method to make GET requests
  Future<http.Response> getRequest(String endpoint) async {
    final uri = Uri.parse('${ApiConstant.baseUrl}/$endpoint');
    final clientInstance = await client;
    return await clientInstance.get(uri, headers: _getHeaders());
  }

  // Method to make POST requests
  Future<http.Response> postRequest(String endpoint, dynamic data) async {
    final uri = Uri.parse('${ApiConstant.baseUrl}/$endpoint');
    final clientInstance = await client;
    return await clientInstance.post(uri, headers: _getHeaders(), body: jsonEncode(data));
  }

  // Method to make PUT requests
  Future<http.Response> putRequest(String endpoint, dynamic data) async {
    final uri = Uri.parse('${ApiConstant.baseUrl}/$endpoint');
    final clientInstance = await client;
    return await clientInstance.put(uri, headers: _getHeaders(), body: jsonEncode(data));
  }

  // Method to make DELETE requests
  Future<http.Response> deleteRequest(String endpoint) async {
    final uri = Uri.parse('${ApiConstant.baseUrl}/$endpoint');
    final clientInstance = await client;
    return await clientInstance.delete(uri, headers: _getHeaders());
  }
}
