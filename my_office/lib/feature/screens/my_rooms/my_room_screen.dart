import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_office/feature/constants/theme.dart';
import 'package:my_office/feature/model/room_model.dart';
import 'package:my_office/feature/screens/my_rooms/selected_room.dart';

const List<String> list = <String>[
  'Шал',
  'цонх',
  'хана',
  'ерөнхий',
];

class MyRoomScreen extends StatefulWidget {
  const MyRoomScreen({Key? key}) : super(key: key);
  @override
  State<MyRoomScreen> createState() => _MyRoomScreenState();
}

class _MyRoomScreenState extends State<MyRoomScreen> {
  ScrollController scrollController = ScrollController();
  bool _isVisible = true;
  // final double _opacity = 1.0;
  bool isLoading = true;
  List<dynamic> _data = [];
  List<dynamic> _filteredData = [];
  String _filterValue = "бүх барилга";

  Future<String> getData() async {
    var response =
        await http.get(Uri.parse("https://ub-office.mn/mobile/room/list"));
    if (mounted) {
      setState(() {
        var data = json.decode(response.body);
        _data = data;
        _filteredData = data;
      });
    }

    if (response.statusCode == 200) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
    return "Success!";
  }

  void _filterData(String value) {
    List<dynamic> tempList = [];
    for (int i = 0; i < _data.length; i++) {
      if (value == "бүх барилга" || _data[i]['building_name'] == value) {
        tempList.add(_data[i]);
      }
    }
    setState(() {
      _filterValue = value;
      _filteredData = tempList;
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      setState(() {
        // Change the visibility based on the position of the scroll
        _isVisible = scrollController.offset <= 50;
      });
    });
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Text(
          'Миний өрөөнүүд',
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: AppColors.mainColor,
            ))
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: _isVisible,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    child: Expanded(
                      flex: 1,
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 150,
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(137, 158, 158, 158),
                                      blurRadius: 5.0,
                                      spreadRadius: 1,
                                      offset: Offset(
                                        0.0, // Move to right 7.0 horizontally
                                        1.0, // Move to bottom 8.0 Vertically
                                      ),
                                    ),
                                  ],
                                  // border: Border.all(width: 0.5, color: AppColors.grey),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const DropdownButtonExample(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(137, 158, 158, 158),
                                        blurRadius: 5.0,
                                        spreadRadius: 1,
                                        offset: Offset(
                                          0.0, // Move to right 7.0 horizontally
                                          1.0, // Move to bottom 8.0 Vertically
                                        ),
                                      ),
                                    ],
                                    // border: Border.all(width: 0.5, color: AppColors.grey),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: DropdownButton<String>(
                                      underline: Container(),
                                      value: _filterValue,
                                      onChanged: (String? value) {
                                        _filterData(value.toString());
                                      },
                                      items: <String>[
                                        'бүх барилга',
                                        'Union building',
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 9,
                  // height: MediaQuery.of(context).size.height,
                  // width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    controller: scrollController,
                    // padding: const EdgeInsets.all(4),
                    itemCount: _filteredData.length,
                    itemBuilder: (BuildContext context, int index) {
                      // RoomModel room = listRoom[index];

                      Color textColor = AppColors.mainColor; // default color
                      if (_filteredData[index]['door_number'] == null) {
                        textColor = AppColors.mainColor;
                      } else if (_filteredData[index]['door_number'] == '') {
                        textColor = const Color.fromARGB(255, 243, 100, 90);
                      } else {
                        textColor = const Color.fromARGB(255, 243, 100, 90);
                      }

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectedRoom(
                                    roomId: _filteredData[index]['room_id']
                                        .toString(),
                                    barTitle: _filteredData[index]
                                                ['door_number'] !=
                                            null
                                        ? '${_filteredData[index]['door_number']}, ${_filteredData[index]['building_name']}'
                                        : '804, ${_filteredData[index]['building_name']}'),
                              ),
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.095,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(137, 158, 158, 158),
                                  blurRadius: 3.0,
                                  spreadRadius: 0.5,
                                  offset: Offset(
                                    2.0, // Move to right 7.0 horizontally
                                    2.0, // Move to bottom 8.0 Vertically
                                  ),
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.25,
                                          decoration: BoxDecoration(
                                            color: textColor,
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(12),
                                              bottomRight: Radius.circular(15),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              _filteredData[index]
                                                          ['door_number'] !=
                                                      null
                                                  ? _filteredData[index]
                                                          ['door_number']
                                                      .toString()
                                                  : '',
                                              style: TextStyles.white16semibold,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          _filteredData[index]['building_name']
                                              .toString(),
                                          style: TextStyles.black17semibold,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: .0),
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Давхар : 8',
                                              style: TextStyles.grey14semibold,
                                            ),
                                            Text(
                                              'Давхар : 8',
                                              style: TextStyles.grey14semibold,
                                            ),
                                            Text(
                                              'Давхар : 8',
                                              style: TextStyles.grey14semibold,
                                            ),
                                            Text(
                                              'Давхар : 8',
                                              style: TextStyles.grey14semibold,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
      bottomNavigationBar: Visibility(
        visible: _isVisible,
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          child: Container(
            height: 55,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(137, 158, 158, 158),
                  blurRadius: 7.0,
                  spreadRadius: 0.5,
                  offset: Offset(
                    2.0, // Move to right 7.0 horizontally
                    -2.0, // Move to bottom 8.0 Vertically
                  ),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    child: Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 243, 100, 90),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      'Түрээслэгдсэн',
                      style: TextStyles.black14semibold,
                    ),
                  ],
                )),
                SizedBox(
                    child: Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.mainColor,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      'Түрээслэгдээгүй',
                      style: TextStyles.black14semibold,
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(
        Icons.expand_more,
        size: 30,
        color: Color.fromARGB(255, 77, 77, 77),
      ),
      elevation: 16,
      style: TextStyles.black17,
      underline: Container(
        height: 2,
        color: Colors.transparent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(value),
          ),
        );
      }).toList(),
    );
  }
}

class FetchRoomList {
  var data = [];
  List<RoomModel> results = [];
  String urlList = 'https://ub-office.mn/mobile/room/list';

  Future<List<RoomModel>> getRoomList() async {
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        data = json.decode(response.body);
        // log(response.body);
        results = data.map((e) => RoomModel.fromJson(e)).toList();
      } else {
        log("fetch error:${response.statusCode}");
      }
    } on Exception catch (e) {
      log('error: $e');
    }
    return results;
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
