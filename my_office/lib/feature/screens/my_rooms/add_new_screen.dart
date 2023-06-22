import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:my_office/feature/constants/theme.dart';
import 'package:path/path.dart' as path;

class AddNewItem extends StatefulWidget {
  final int roomId;
  const AddNewItem({super.key, required this.roomId});

  @override
  _AddNewItemState createState() => _AddNewItemState();
}

class Item {
  String extension;
  String base64Image;

  Item(this.extension, this.base64Image);
}

class _AddNewItemState extends State<AddNewItem> {
  // final int _currentValue = 3;
  final descriptionController = TextEditingController();
  final numberController = TextEditingController();
  List<Item> itemList = [];

  final ImagePicker _imagePicker = ImagePicker();

  Future<void> pickImageAndAddItem() async {
    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      File image = File(pickedFile.path);
      String extension = path.extension(pickedFile.path);

      List<int> imageBytes = await image.readAsBytes();
      String base64Image = base64Encode(imageBytes);

      setState(() {
        itemList.add(Item(extension, base64Image));
      });
    }
  }

  Future<void> sendListToServer() async {
    try {
      String serverUrl =
          'https://ub-office.mn/mobile/room/tool/store/${widget.roomId}'; // Replace with your server URL
      List<Map<String, dynamic>> data = [];
      for (var item in itemList) {
        data.add({
          'tool_ext': item.extension,
          'tool_image': item.base64Image,
        });
      }
      String jsonData = json.encode(data);
      // log(data.toString());

      final response = await http.post(
        Uri.parse(serverUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'mobile_tools': jsonData,
          'selected_room_id': widget.roomId,
          'quantity': numberController.text,
          'type': 1,
          'user_id': 9,
          "description": descriptionController.text,
        }),
      );

      if (response.statusCode == 200) {
        log('List sent to the server successfully.');
        Navigator.pop(context);
      } else {
        log('Failed to send list to the server. Status code: ${response.statusCode}');
      }
    } catch (error) {
      log('Error sending list to the server: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Шинэ эд зүйл нэмэх'),
        backgroundColor: AppColors.mainColor,
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.95,
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                        hinttext: 'Тайлбар',
                        controller: descriptionController,
                        width: MediaQuery.of(context).size.width * 0.95),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomNumberField(
                        hinttext: 'Тоо ширхэг',
                        controller: numberController,
                        width: MediaQuery.of(context).size.width * 0.95),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        hinttext: 'Төрөл',
                        controller: descriptionController,
                        width: MediaQuery.of(context).size.width * 0.95),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: pickImageAndAddItem,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppColors.greyBack,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.add_a_photo),
                                Text(
                                  'Зураг нэмэх',
                                  style: TextStyles.black17,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.23,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: itemList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: AppColors.mainColor)),
                              height: MediaQuery.of(context).size.height * 0.2,
                              // leading: Text(itemList[index].extension),
                              child: Image.memory(
                                base64Decode(itemList[index].base64Image),
                                // width: 50,
                                // height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    InkWell(
                      onTap: sendListToServer,
                      child: Container(
                        height: 50,
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
              ),
            ],
          ),
        ),
      ),
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

class CustomNumberField extends StatelessWidget {
  final String hinttext;
  final TextEditingController controller;
  final double width;
  final String? Function(String?)? validator;
  const CustomNumberField(
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
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.number,
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
