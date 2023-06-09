import 'package:flutter/material.dart';
import 'package:my_office/feature/constants/theme.dart';
import 'package:my_office/feature/public/globals.dart';
import 'package:my_office/feature/screens/notification/owner_notif_screen.dart';
import 'package:my_office/feature/screens/owner/dashboard/widget/all_space.dart';
import 'package:my_office/feature/screens/owner/dashboard/widget/contact_widget.dart';
import 'package:my_office/feature/screens/owner/dashboard/widget/garchig.dart';
import 'package:my_office/feature/screens/owner/dashboard/widget/midman.dart';
import 'package:my_office/feature/screens/renter/dashboard_screen.dart';
import 'package:my_office/feature/screens/my_rooms/my_room_screen.dart';

import '../../../model/room_model.dart';

bool isLoading = true;
bool clicked = false;
bool seen = false;

class DashboardScreenOwner extends StatefulWidget {
  const DashboardScreenOwner({super.key});

  @override
  State<DashboardScreenOwner> createState() => _DashboardScreenOwnerState();
}

class _DashboardScreenOwnerState extends State<DashboardScreenOwner> {
  FetchRoomList fetchRoomList = FetchRoomList();

  List<RoomModel> listRoom = [];
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
  void initState() {
    print(Globals.isLogin);
    super.initState();

    getGetRoomApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Хянах самбар',
            style: TextStyles.white17,
          ),
          backgroundColor: AppColors.mainColor,
          actions: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    seen = true;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const NotificationScreenOwner(),
                      ));
                },
                child: Stack(
                  children: [
                    const Icon(
                      Icons.notifications,
                      size: 30,
                    ),
                    seen
                        ? Container()
                        : Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(60)),
                          )
                  ],
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                      // height: MediaQuery.of(context).size.height * 0.9,
                      child: Padding(
                        padding: EdgeInsets.only(
                          // left: 8.0,
                          // right: 8,
                          top: 10,
                        ),
                        child: Column(
                          children: [
                            Garchig(),
                            SizedBox(
                              height: 10,
                            ),

                            AllMoneyWidget(),

                            SizedBox(
                              height: 10,
                            ),
                            MonthMoney(),
                            SizedBox(
                              height: 10,
                            ),

                            AllSpace(),
                            SizedBox(
                              height: 10,
                            ),
                            MidManWidget(),
                            SizedBox(
                              height: 10,
                            ),
                            // const OwnerManagementScreen(),
                            // ContactOwner(),
                            HelpWidget(),
                            // const DashBoardWidget(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class MonthMoney extends StatelessWidget {
  const MonthMoney({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.135,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Сарын орлого',
                style: TextStyles.white15semibold,
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: 110,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Нийт орлого',
                            style: TextStyles.black14,
                          ),
                          Text(
                            '0₮',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Түрээсийн',
                            style: TextStyles.black14,
                          ),
                          Text(
                            '0₮',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
