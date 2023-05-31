// import 'dart:developer';

// // import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'dart:convert';

// import 'package:http/http.dart' as http;

// class LoginService {
//   final String baseUrl = 'https://ub-office.mn/mobile';

//   Future<bool> login(String username, String password) async {
//     final response = await http.get(
//       Uri.parse('$baseUrl/login?gmail=$username&password=$password'),
//       headers: {
//         'Content-Type': 'application/json',
//       },
//     );

//     if (response.statusCode == 200) {
//       final jsonData = jsonDecode(response.body);

//       log('status code : ${response.statusCode}');
//       log('first name : ${jsonData['data']['firstname']}');
//       return jsonData['status'];
//     } else {
//       throw Exception('Failed to login');
//     }
//   }
// }
