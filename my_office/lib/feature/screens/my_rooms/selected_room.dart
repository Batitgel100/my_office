import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_office/feature/constants/theme.dart';
import 'package:my_office/feature/screens/chat/model/tool_model.dart';
import 'package:my_office/feature/screens/my_rooms/add_new_screen.dart';
import 'package:my_office/feature/screens/my_rooms/room_info.dart';
import 'package:http/http.dart' as http;

bool isLoad = true;

class SelectedRoom extends StatefulWidget {
  final String buildingName;
  final String doorNumber;
  final String floor;
  final String address;
  final String wallHeight;
  final String rentalFee;
  final String totelRent;
  final String owner;
  final String ownerEmail;
  final String ownerPhone;
  final String status;
  final String barTitle;
  final int roomId;
  const SelectedRoom(
      {super.key,
      required this.roomId,
      required this.barTitle,
      required this.buildingName,
      required this.doorNumber,
      required this.floor,
      required this.address,
      required this.wallHeight,
      required this.rentalFee,
      required this.totelRent,
      required this.owner,
      required this.ownerEmail,
      required this.ownerPhone,
      required this.status});

  @override
  State<SelectedRoom> createState() => _SelectedRoomState();
}

class _SelectedRoomState extends State<SelectedRoom> {
  List<XFile> selectedImages = []; // List to store the selected images

  List<Tool> tools = [];
  bool _isLoading = true;

  // List<dynamic> _data = [];

  @override
  void initState() {
    fetchData();
    super.initState();

    // _getData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://ub-office.mn/mobile/room/tools/data/${widget.roomId}'));
      print('Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as List<dynamic>;
        setState(() {
          _isLoading = false;
          tools = jsonData.map((item) => Tool.fromJson(item)).toList();
        });
      } else {
        print('Error: Failed to fetch data');
      }
    } catch (error) {
      print('Exception occurred: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: SelectedRoomAppBar(widget: widget),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // height: 500,
        // color: Colors.red,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.92,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Өрөөний мэдээлэл', style: TextStyles.black17),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => RoomInfoScreen(
                              address: widget.address,
                              buildingName: widget.buildingName,
                              doorNumber: widget.doorNumber,
                              floor: widget.floor,
                              owner: widget.owner,
                              ownerEmail: widget.ownerEmail,
                              ownerPhone: widget.ownerPhone,
                              rentalFee: widget.rentalFee,
                              status: widget.status,
                              totelRent: widget.totelRent,
                              wallHeight: widget.wallHeight,
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'Дэлгэрэнгүй',
                        style: TextStyle(color: Colors.blue, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Container(
                // height: 520,
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(
                    // color: AppColors.mainColor,
                    border: Border.all(color: AppColors.mainColor, width: 5),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    MyRoomWidget(
                      text: 'Төлөв',
                      text2: widget.doorNumber,
                    ),
                    MyRoomWidget(
                      text: 'Барилгын нэр',
                      text2: widget.buildingName,
                    ),
                    MyRoomWidget(
                      text: 'Эзэмшигч',
                      text2: widget.owner,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Зургууд', style: TextStyles.black17),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => AddNewItem(
                                      roomId: widget.roomId,
                                    )));
                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.greyBack),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.add),
                            Text('шинэ эд зүйл нэмэх'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.mainColor,
                      ),
                    )
                  : Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: tools.isEmpty
                              ? const Text('Эд хөрөнгө бүртгэгдээгүй байна')
                              : SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.50,
                                  width:
                                      MediaQuery.of(context).size.width * 0.955,
                                  child: ListView.builder(
                                    itemCount: tools.length,
                                    itemBuilder: (context, index) {
                                      final isFirstItem = index == 0;
                                      final image = tools[index];

                                      return Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.15,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  1,
                                              decoration: BoxDecoration(
                                                // border: Border.all(
                                                //     width: 0, color: AppColors.mainColor),
                                                borderRadius: isFirstItem
                                                    ? const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(12),
                                                        topRight:
                                                            Radius.circular(12))
                                                    : null,
                                                color: const Color.fromARGB(
                                                    255, 255, 255, 255),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 3,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(image.name,
                                                              style: TextStyles
                                                                  .black14semibold),
                                                          Text(
                                                              'Төрөл : ${image.description}'),
                                                          Text(
                                                              'Тоо ширхэг : ${image.quantity}'),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 4,
                                                      child:
                                                          // picture == null
                                                          //     ? const SizedBox()
                                                          //     :
                                                          ListView.builder(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount:
                                                            image.images.length,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                              ),
                                                              child: Image.network(
                                                                  'https://ub-office.mn${image.images[index]}'),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 10.0),
                                                        child: InkWell(
                                                          onTap: () {
                                                            print(image.images
                                                                .toString());
                                                          },
                                                          // pickImages,
                                                          child: Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.07,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                              color: AppColors
                                                                  .greyBack,
                                                            ),
                                                            child: const Center(
                                                              child: Icon(
                                                                Icons.edit,
                                                                size: 25,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    height: 0.4,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: Container(
                                                    height: 0.4,
                                                    color: AppColors.mainColor,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectedRoomAppBar extends StatelessWidget {
  const SelectedRoomAppBar({
    super.key,
    required this.widget,
  });

  final SelectedRoom widget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.barTitle,
        style: TextStyles.white17,
      ),
      backgroundColor: AppColors.mainColor,
      elevation: 0,
      leadingWidth: 70,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          // height: 55,
          width: 60,
          decoration: BoxDecoration(
            // color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.arrow_back_ios,
                // color: AppColors.secondBlack,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LineGreen extends StatelessWidget {
  const LineGreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      color: AppColors.mainColor,
    );
  }
}

class MyRoomWidget extends StatefulWidget {
  final String text;

  final String text2;
  const MyRoomWidget({super.key, required this.text, required this.text2});

  @override
  State<MyRoomWidget> createState() => _MyRoomWidgetState();
}

class _MyRoomWidgetState extends State<MyRoomWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // border: Border.all(width: 3, color: AppColors.mainColor),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(),
                color: AppColors.mainColor,
              ),
              child: Center(
                child: Text(
                  widget.text,
                  style: TextStyles.white17,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                widget.text2,
                style: TextStyles.black17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
