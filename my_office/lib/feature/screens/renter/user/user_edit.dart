import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_office/feature/constants/theme.dart';
import 'package:my_office/feature/public/globals.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;

class UserEdit extends StatefulWidget {
  // final TextEditingController emailController;
  // final TextEditingController passwordController;
  // final TextEditingController lastNameController;
  // final TextEditingController firstNameController;
  // final TextEditingController adressController;
  // final TextEditingController registerController;
  // final TextEditingController phoneController;
  // final VoidCallback onTap;

  const UserEdit({
    super.key,
  });

  @override
  State<UserEdit> createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final adressController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final registerController = TextEditingController();
  File? image;

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

  Future<void> updateUserWithoutProfile() async {
    // Set the URL for your Laravel endpoint
    String url = 'https://ub-office.mn/mobile/profile/edit/9';

    // Convert the image file to base64-encoded string

    // Create the request body
    Map<String, dynamic> userData = {
      'firstname': firstNameController.text,
      'lastname': lastNameController.text,
      'address': adressController.text,
      'phone': phoneNumberController.text,
      'register': registerController.text,
      'email': emailController.text,
      'password': passwordController.text,
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

        Globals.changeFirstName(firstNameController.text);
        Globals.changeAddress(
          adressController.text,
        );
        Globals.changeGmail(
          emailController.text,
        );
        Globals.changeUserPhone(
          phoneNumberController.text,
        );
        Globals.changeRegister(
          registerController.text,
        );
        Globals.changeLastName(
          lastNameController.text,
        );
        Navigator.pop(context);
        setState(() {});
      } else {
        print('Failed to update user. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
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
      'firstname': firstNameController.text,
      'lastname': lastNameController.text,
      'address': adressController.text,
      'phone': phoneNumberController.text,
      'register': registerController.text,
      'email': emailController.text,
      'password': passwordController.text,
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
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Text('Хэрэглэгчийн мэдээлэл'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: image == null
                    ? InkWell(
                        onTap: getImage,
                        child: Stack(
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80),
                                  color: AppColors.grey),
                              child: const Icon(
                                color: Colors.white,
                                Icons.person,
                                size: 100,
                              ),
                            ),
                            const Positioned(
                                top: 10,
                                left: 100,
                                child: Icon(
                                  Icons.edit,
                                  size: 50,
                                )),
                          ],
                        ),
                      )
                    : Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            color: AppColors.grey),
                        child: Image.file(image!),
                      ),
              ),
            ),
            Expanded(
              flex: 7,
              child: SizedBox(
                // height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.width * 0.95,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Нэр',
                              style: TextStyles.black14,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomTextField(
                              width: MediaQuery.of(context).size.width * 0.46,
                              hinttext: Globals.firstname,
                              controller: firstNameController,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Овог',
                              style: TextStyles.black14,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomTextField(
                              width: MediaQuery.of(context).size.width * 0.46,
                              hinttext: Globals.lastname,
                              controller: lastNameController,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Регистрийн дугаар',
                              style: TextStyles.black14,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomTextField(
                              width: MediaQuery.of(context).size.width * 0.46,
                              hinttext: Globals.register,
                              controller: registerController,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Мэйл хаяг',
                              style: TextStyles.black14,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomTextField(
                              width: MediaQuery.of(context).size.width * 0.46,
                              hinttext: Globals.gmail,
                              controller: emailController,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Хаяг',
                      style: TextStyles.black14,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      width: MediaQuery.of(context).size.width * 0.95,
                      hinttext: Globals.address,
                      controller: adressController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Утас',
                              style: TextStyles.black14,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomTextField(
                              width: MediaQuery.of(context).size.width * 0.46,
                              hinttext: Globals.phone,
                              controller: phoneNumberController,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Нууц үг',
                              style: TextStyles.black14,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomTextField(
                              width: MediaQuery.of(context).size.width * 0.46,
                              hinttext: 'Нууц үг',
                              controller: passwordController,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.065,
                              width: MediaQuery.of(context).size.width * 0.46,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color:
                                      const Color.fromARGB(255, 176, 174, 174)),
                              child: const Center(
                                child: Text(
                                  'буцах',
                                  style: TextStyles.white17,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: image == null
                                ? updateUserWithoutProfile
                                : updateUser,
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.065,
                              width: MediaQuery.of(context).size.width * 0.46,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.mainColor),
                              child: const Center(
                                child: Text(
                                  'Хадгалах',
                                  style: TextStyles.white17,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomLine extends StatelessWidget {
  const CustomLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 0.2,
          color: const Color.fromARGB(255, 110, 110, 110),
          width: MediaQuery.of(context).size.width * 0.78,
        ),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hinttext;
  final TextEditingController controller;
  final double width;
  final String? Function(String?)? validator;
  const CustomTextField(
      {super.key,
      required this.hinttext,
      required this.controller,
      required this.width,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.065,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.mainColor, width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
          child: TextFormField(
            validator: validator,
            controller: controller,
            decoration: InputDecoration.collapsed(
              hintText: hinttext,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomUserButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final BorderRadius radius;
  final String title;
  final IconData icon;
  final Widget seconIcon;

  const CustomUserButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.radius,
    required this.title,
    required this.icon,
    required this.seconIcon,
  });

  @override
  State<CustomUserButton> createState() => _CustomUserButtonState();
}

class _CustomUserButtonState extends State<CustomUserButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration:
            BoxDecoration(color: Colors.white, borderRadius: widget.radius),
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.93,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 5),
                      child: Icon(
                        widget.icon,
                        color: const Color.fromARGB(255, 72, 72, 72),
                      ),
                    ),
                    Text(
                      widget.title,
                      style: TextStyles.black13,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Text(
                        widget.text,
                        style: TextStyles.black13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}
