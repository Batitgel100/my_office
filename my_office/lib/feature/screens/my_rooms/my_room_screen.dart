import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_office/feature/constants/theme.dart';
import 'package:my_office/feature/model/room_model.dart';
import 'package:my_office/feature/screens/chat/model/room_model.dart';
import 'package:my_office/feature/screens/my_rooms/selected_room.dart';

class MyRoomScreen extends StatefulWidget {
  const MyRoomScreen({Key? key}) : super(key: key);
  @override
  State<MyRoomScreen> createState() => _MyRoomScreenState();
}

class _MyRoomScreenState extends State<MyRoomScreen> {
  ScrollController scrollController = ScrollController();
  bool _isVisible = true;
  // final double _opacity = 1.0;
  bool loading = true;
  List<Item> roomList = [];
  List<Item> filteredList = [];

  @override
  void initState() {
    fetchData();

    scrollController.addListener(() {
      setState(() {
        // Change the visibility based on the position of the scroll
        _isVisible = scrollController.offset <= 50;
      });
    });
    super.initState();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://ub-office.mn/mobile/room/list'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data is List) {
        List<Item> fetchedItems =
            data.map((json) => Item.fromJson(json)).toList();
        setState(() {
          loading = false;
          roomList = fetchedItems;
          filteredList = fetchedItems;
        });
      } else {
        // Handle error - Invalid data format
        print('Invalid data format - Response is not a list');
      }
    } else {
      // Handle error - HTTP request failed
      print('Failed to fetch data');
    }
  }

  void filterSearchResults(String query) {
    List<Item> searchResults = [];
    searchResults.addAll(roomList);

    if (query.isNotEmpty) {
      query = query.toLowerCase();
      searchResults.retainWhere(
        (item) =>
            item.doorNumber!.toLowerCase().contains(query) ||
            item.buildingName!.toLowerCase().contains(query),
      );
    }

    setState(() {
      filteredList = searchResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mainColor,
        title: const Text(
          'Миний өрөөнүүд',
          style: TextStyles.white17,
        ),
      ),
      body: loading
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
                        height: 50,
                        decoration: const BoxDecoration(
                          color: AppColors.background,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8),
                          child: TextField(
                            onChanged: (value) {
                              filterSearchResults(value);
                            },
                            decoration: InputDecoration(
                              prefixIconColor: AppColors.mainColor,
                              labelText: 'Барилгаар,эсвэл тоотоор хайх',
                              prefixIcon: const Icon(Icons.search),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: filteredList.length,
                    itemBuilder: (BuildContext context, int index) {
                      Color textColor = AppColors.mainColor; // default color
                      if (filteredList[index].doorNumber == null) {
                        textColor = AppColors.mainColor;
                      } else if (filteredList[index].doorNumber ==
                          filteredList[index].doorNumber) {
                        textColor = const Color.fromARGB(255, 248, 124, 115);
                      } else {
                        textColor = const Color.fromARGB(255, 248, 124, 115);
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
                                  roomId: filteredList[index].roomId,
                                  barTitle: filteredList[index].doorNumber !=
                                          null
                                      ? '${filteredList[index].doorNumber}, ${filteredList[index].buildingName}'
                                      : '804, ${filteredList[index].buildingName}',
                                  address: filteredList[index]
                                      .buildingAddress
                                      .toString(),
                                  buildingName: filteredList[index]
                                      .buildingName
                                      .toString(),
                                  doorNumber:
                                      filteredList[index].doorNumber.toString(),
                                  floor: filteredList[index].floor.toString(),
                                  owner:
                                      filteredList[index].ownerName.toString(),
                                  ownerEmail:
                                      filteredList[index].ownerEmail.toString(),
                                  ownerPhone:
                                      filteredList[index].ownerPhone.toString(),
                                  rentalFee:
                                      filteredList[index].rentalFee.toString(),
                                  status:
                                      filteredList[index].doorNumber.toString(),
                                  totelRent:
                                      filteredList[index].totalRent.toString(),
                                  wallHeight:
                                      filteredList[index].wallHeight.toString(),
                                ),
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
                                              filteredList[index].doorNumber !=
                                                      null
                                                  ? filteredList[index]
                                                      .doorNumber
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
                                          filteredList[index]
                                              .buildingName
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
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Давхар : ${filteredList[index].floor}',
                                              style: TextStyles.grey12semibold,
                                            ),
                                            Text(
                                              'Хананы өндөр : ${filteredList[index].wallHeight}',
                                              style: TextStyles.grey12semibold,
                                            ),
                                            const Text(
                                              'Давхар : 8',
                                              style: TextStyles.grey12semibold,
                                            ),
                                            const Text(
                                              'Давхар : 8',
                                              style: TextStyles.grey12semibold,
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

// class DropdownButtonExample extends StatefulWidget {
//   const DropdownButtonExample({super.key});

//   @override
//   State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
// }

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
