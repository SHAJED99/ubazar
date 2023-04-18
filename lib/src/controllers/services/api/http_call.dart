import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpCall {
  static final Map<String, String> _header = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };
  static const String _baseLink = "https://pqstec.com";
  static const Duration _timeout = Duration(seconds: 10);

  static Future<http.Response> get({required String url, String? token}) async {
    final Map<String, String> header = _header;
    if (token != null) {
      header.addAll({"Authorization": token});
    }
    return await http.get(Uri.parse(_baseLink + url), headers: header).timeout(_timeout);
  }
}
