// import 'dart:convert';
// import 'dart:developer';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;

// class UserRepository {
//   static const String apiUrl = 'https://ub-office.mn/mobile/profile/edit/9';
//   Future updatePage(
//     String firstname,
//     String lastname,
//     String phone,
//     String email,
//     String register,
//     String address,
//     String password,
//     // Image image,
//   ) async {
//     try {
//       final response = await http.put(Uri.parse(apiUrl), body: {
//         'firstname': firstname,
//         'lastname': lastname,
//         'address': address,
//         'phone': phone,
//         'register': register,
//         'email': email,
//         'password': password,
//         // 'file0': image,
//       });

//       if (response.statusCode == 200) {
//         log('*** Амжилттай солигдлоо ***');
//         return true;
//       } else {
//         print(
//           response.statusCode,
//         );
//         print(response.body);
//         return false;
//       }
//     } catch (e) {
//       return e.toString();
//     }
//   }

//   Future<Uint8List> loadImageFromAssets(String path) async {
//     final byteData = await rootBundle.load(path);
//     return byteData.buffer.asUint8List();
//   }

//   Future<void> uploadImageAndAddToJSON(Map<String, dynamic> jsonData) async {
//     // Load the image data from assets
//     String imageData = (loadImageFromAssets('assets/images/3.png').toString());

//     // Add the image data to the JSON data
//     jsonData['file0'] = imageData;

//     // Convert the JSON data to a string
//     String jsonString = jsonEncode(jsonData);

//     // Create a PUT request with the JSON data
//     var response = await http.put(
//       Uri.parse('https://ub-office.mn/mobile/profile/edit/9'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonString,
//     );

//     // Check the response status
//     if (response.statusCode == 200) {
//       // Image and JSON data uploaded successfully
//       print('Image and JSON data uploaded successfully');
//     } else {
//       // An error occurred while uploading
//       print(
//           'Error uploading image and JSON data. Status code: ${response.statusCode}');
//     }
//   }
// }
