import 'package:flutter/material.dart';
import 'package:my_office/feature/constants/theme.dart';
import 'package:my_office/feature/model/room_model.dart';
import 'package:my_office/feature/screens/renter/filter_screen.dart';
import 'package:my_office/feature/screens/my_rooms/my_room_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ScrollController scrollController = ScrollController();
  bool isLoading = true;
  FetchRoomList fetchRoomList = FetchRoomList();
  List<RoomModel> listRoom = [];
  @override
  void initState() {
    scrollController.addListener(() {
      setState(() {
        // Change the visibility based on the position of the scroll
      });
    });
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
      body: Column(
        children: [
          Container(
            height: 140,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: AppColors.mainColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 10.0,
                left: 20,
                right: 5,
                top: 75,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: Padding(
                          padding:
                              EdgeInsets.only(right: 0.0, left: 15, top: 5),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: Icon(Icons.search),
                              hintText: 'Хайлт хийх',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const FilterScreen(),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.sort,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const FilterScreen(),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.tune,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          // Visibility(
          //   visible: _isVisible,
          //   child: Padding(
          //     padding: const EdgeInsets.only(
          //       top: 8,
          //       bottom: 8,
          //     ),
          //     child: SizedBox(
          //       height: 42,
          //       width: MediaQuery.of(context).size.width,
          //       child: ListView.builder(
          //         padding: const EdgeInsets.only(
          //           left: 20.0,
          //         ),
          //         scrollDirection: Axis.horizontal,
          //         itemCount: 4,
          //         itemBuilder: (BuildContext context, int index) {
          //           return Padding(
          //             padding: const EdgeInsets.only(right: 8.0),
          //             child: Container(
          //               height: 42,
          //               width: 120,
          //               decoration: BoxDecoration(
          //                 color: AppColors.mainColor,
          //                 borderRadius: BorderRadius.circular(15),
          //               ),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                 children: const [
          //                   Text(
          //                     'filter',
          //                     style: TextStyle(
          //                       color: Colors.white,
          //                       fontSize: 16,
          //                     ),
          //                   ),
          //                   // Icon(
          //                   //   Icons.close,
          //                   //   color: Colors.white,
          //                   // )
          //                 ],
          //               ),
          //             ),
          //           );
          //         },
          //       ),
          //     ),
          //   ),
          // ),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    controller: scrollController,
                    padding: const EdgeInsets.all(0),
                    itemCount: listRoom.length,
                    itemBuilder: (BuildContext context, int index) {
                      RoomModel room = listRoom[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.grey,
                              borderRadius: BorderRadius.circular(20)),
                          height: 200,
                          child: Center(
                            child: Text(room.roomId.toString()),
                          ),
                          // width: 300,
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
