import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class YourWidget extends StatefulWidget {
  const YourWidget({super.key});

  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  File? image;
  bool showSpinner = false;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
      print(image!.path);
      // log(path.extension(pickedFile.path));
    } else {
      print('No image selected');
    }
  }

  Future<void> updateUser() async {
    // Set the URL for your Laravel endpoint
    String url = 'https://ub-office.mn/mobile/profile/edit/9';

    // Convert the image file to base64-encoded string
    List<int> imageBytes = await image!.readAsBytes();
    String base64Image = base64Encode(imageBytes);

    // Create the request body
    Map<String, dynamic> userData = {
      'firstname': 'worldnet',
      'lastname': '',
      'address': '123 Street',
      'phone': '99999999',
      'register': '1234567',
      'email': 'worldnet@mail.com',
      'password': '12345678',
      'mobile_profile': base64Image,
      'profile_ext': path.extension(image!.path),
    };

    // Convert the request body to JSON
    String jsonData = jsonEncode(userData);

    try {
      // Make the HTTP PUT request
      final response = await http.post(
        Uri.parse(url),
        body: jsonData,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      log(response.body);
      // log(path.extension(image!.path));
      // print(base64Image);
      // Check the response status code
      if (response.statusCode == 200) {
        print('*** Хэрэглэгч амжилттай засагдлаа ***');
      } else {
        print('Failed to update user. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: getImage,
            child: const Text('Pick Image'),
          ),
          ElevatedButton(
            onPressed: updateUser,
            child: const Text('Update User'),
          ),
          if (image != null) Image.file(image!),
        ],
      ),
    );
  }
}
