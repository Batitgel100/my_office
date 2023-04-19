import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_office/feature1/constants/theme.dart';
import 'package:my_office/feature2/model/room_model.dart';
import 'package:my_office/feature2/screens/renter/selected_room.dart';

class MyRoomScreen extends StatefulWidget {
  const MyRoomScreen({Key? key}) : super(key: key);
  @override
  State<MyRoomScreen> createState() => _MyRoomScreenState();
}

class _MyRoomScreenState extends State<MyRoomScreen> {
  bool isLoading = true;
  FetchRoomList fetchRoomList = FetchRoomList();
  List<RoomModel> listRoom = [];
  @override
  void initState() {
    getGetRoomApi();
    super.initState();
  }

  getGetRoomApi() async {
    List<RoomModel> rooms = await fetchRoomList.getRoomList();
    if (mounted) {
      setState(() {
        listRoom = rooms;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Text('Миний өрөө'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isLoading)
            const Center(child: CircularProgressIndicator())
          else
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(4),
                itemCount: listRoom.length,
                itemBuilder: (BuildContext context, int index) {
                  RoomModel room = listRoom[index];

                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectedRoom(
                              roomId: room.id.toString(),
                            ),
                          ),
                        );
                      },
                      child: Ink(
                        child: Center(
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(164, 63, 162, 157),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Text(
                                      room.levelId.toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 30),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 8 / 5,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class FetchRoomList {
  var data = [];
  List<RoomModel> results = [];
  String urlList = 'https://mymap.mn/mobile/room/list';

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

  Future<void> refreshList() async {
    results = await getRoomList();
  }
}
