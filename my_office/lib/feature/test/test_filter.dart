import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class TestUploadImage extends StatefulWidget {
  const TestUploadImage({super.key});

  @override
  State<TestUploadImage> createState() => _TestUploadImageState();
}

class _TestUploadImageState extends State<TestUploadImage> {
  File? image;
  bool showSpinner = false;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
      print(image!.path);
    } else {
      print('no image selected');
    }
  }

  // Future<void> uploadImage() async {
  //   setState(() {
  //     showSpinner = true;
  //   });

  //   var stream = http.ByteStream(image!.openRead());
  //   stream.cast();
  //   var length = await image!.length();

  //   var uri = Uri.parse('https://ub-office.mn/mobile/profile/edit/9');
  //   var request = http.MultipartRequest('PUT', uri);

  //   request.fields['firstname'] = 'Worldnet';
  //   request.fields['lastname'] = 'lastname';
  //   request.fields['address'] = 'union';
  //   request.fields['phone'] = '99999999';
  //   request.fields['register'] = '12345678';
  //   request.fields['email'] = 'worldnet@gmail.com';
  //   request.fields['password'] = '12345678';

  //   var multipartFile = http.MultipartFile('file0', stream, length);
  //   request.files.add(multipartFile);

  //   var response = await request.send();

  //   if (response.statusCode == 200) {
  //     setState(() {
  //       showSpinner = false;
  //     });
  //     print('nice');
  //   } else {
  //     setState(() {
  //       showSpinner = false;
  //     });
  //     print('sda');
  //   }
  // }
  // Future<void> updateUser(String? image) async {
  //   // Create a map with the updated data
  //   Map<String, dynamic> userData = {
  //     'firstname': 'Worldnet',
  //     'lastname': 'lastname',
  //     'address': 'union',
  //     'phone': '99999999',
  //     'register': '12345678',
  //     'email': 'worldnet@gmail.com',
  //     'password': '12345678',
  //     'file0': image,
  //   };

  //   // Convert the map to JSON
  //   String jsonData = jsonEncode(userData);

  //   try {
  //     // Make the PUT request
  //     final response = await http.put(
  //       Uri.parse('https://ub-office.mn/mobile/profile/edit/9'),
  //       body: jsonData,
  //       headers: {
  //         'Content-Type': 'application/json',
  //       },
  //     );
  //     print(response.body);
  //     // Check the response status code
  //     if (response.statusCode == 200) {
  //       print('User updated successfully');
  //     } else {
  //       print('Failed to update user. Status code: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     print('Error: $error');
  //   }
  // }
  Future<void> updateUser(
    // String url,
    String firstname,
    String lastname,
    String address,
    String phone,
    String register,
    String email,
    String password,
  ) async {
    // Pick an image using ImagePicker
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    // Convert the picked image to base64-encoded string
    List<int> imageBytes = await pickedImage!.readAsBytes();
    String base64Image = base64Encode(imageBytes);

    // Create a map with the updated data
    Map<String, dynamic> userData = {
      'firstname': firstname,
      'lastname': lastname,
      'address': address,
      'phone': phone,
      'register': register,
      'email': email,
      'password': password,
      'image': base64Image,
    };

    // Convert the map to JSON
    String jsonData = jsonEncode(userData);

    try {
      // Make the PUT request
      final response = await http.put(
        Uri.parse('https://ub-office.mn/mobile/profile/edit/9'),
        body: jsonData,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      // Check the response status code
      if (response.statusCode == 200) {
        print('User updated successfully');
      } else {
        print('Failed to update user. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        body: Container(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image == null
                  ? ElevatedButton(
                      onPressed: () {
                        getImage();
                      },
                      child: const Text('pick'),
                    )
                  : Center(
                      child: Image.file(
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                        File(image!.path).absolute,
                      ),
                    ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  // uploadImage();
                  updateUser('Worldnet', 'lastname', 'union', '99999999',
                      '12345678', 'worldnet@gmail.com', '12345678');
                },
                child: const Text('upload'),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
