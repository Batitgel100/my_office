import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class UserRepository {
  static String mainUrl = "https://reqres.in";
  var loginUrl = '$mainUrl/api/login';

  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final Dio _dio = Dio();

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'id');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> persistToken(String token) async {
    await storage.write(key: 'id', value: token);
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'id');
    storage.deleteAll();
  }

  Future<String> login(String phone, String password) async {
    Response response = await _dio.get(loginUrl, data: {
      "username": phone,
      "id": password,
    });
    // log(response.data["register"]);
    return response.data["register"].toString();
  }
}

class LoginService {
  final String baseUrl = 'https://mymap.mn/mobile';

  Future<bool> login(String username, String password) async {
    final response = await http.get(
      Uri.parse('$baseUrl/login?username=$username&password=$password'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      log('status code : ${response.statusCode}');
      log('first name : ${jsonData['data']['firstname']}');
      return jsonData['status'];
    } else {
      throw Exception('Failed to login');
    }
  }
}
